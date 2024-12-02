import 'dart:io';

import 'package:bammulguan/server_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:dio/dio.dart';

class ImagePostScreen extends StatefulWidget {
  final String title;
  final String content;

  const ImagePostScreen(
      {super.key, required this.title, required this.content});

  @override
  State<ImagePostScreen> createState() => _ImagePostScreenState();
}

class _ImagePostScreenState extends State<ImagePostScreen> {
  @override
  void initState() {
    super.initState();
    print("가져온 데이터 ${widget.title}\n ${widget.content}");
  }

  final ImagePicker _picker = ImagePicker();
  final List<XFile?> _pickedImages = [];

  // 이미지 선택
  void getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source, imageQuality: 30);

    setState(() {
      _pickedImages.clear(); // 기존 이미지 제거
      _pickedImages.add(image); // 새 이미지 추가
    });
  }

  Future<void> uploadImage(BuildContext context) async {
    String? fileUrl = "";  // 파일 URL을 저장할 변수 (빈 문자열로 초기화)
    int? fileId;  // 파일 ID를 저장할 변수
    if (_pickedImages.isNotEmpty && _pickedImages.first != null) {
      try {
        File pickedFile = File(_pickedImages.first!.path);

        // FormData 생성
        FormData formData = FormData.fromMap({
          "files": await MultipartFile.fromFile(
            pickedFile.path,
            filename: pickedFile.path.split('/').last,
          ),
        });

        // Dio를 사용한 업로드 요청
        var dio = Dio();
        dio.options.contentType = 'multipart/form-data';

        var response = await dio.post(
          '$SERVER_URL/file', // 서버 업로드 URL
          data: formData,
        );

        print('성공적으로 업로드되었습니다: ${response.data}');
        var responseData = response.data;

        // 서버 응답에서 'data' 배열의 첫 번째 요소 추출
        if (responseData is Map<String, dynamic>) {
          // 'data' 배열 안의 첫 번째 객체에서 'url'과 'id' 추출
          if (responseData['data'] != null && responseData['data'].isNotEmpty) {
            var fileData = responseData['data'][0];
            fileUrl = fileData['url'] ?? "";  // 'url'이 null이면 빈 문자열로 설정
            fileId = fileData['id'] ?? 0;     // 'id'가 null이면 기본값 0으로 설정
          }
        }

        print("Uploaded file URL: $fileUrl");
        print("Uploaded file ID: $fileId");

      } catch (e) {
        print("업로드 중 오류 발생: $e");
      }
    }

    // 업로드 함수 호출
    await upLoad(title: widget.title, content: widget.content, fileId: fileId, context: context);
  }

  Future<void> upLoad(
      {required String title,
        required String content,
        required int? fileId,
      required BuildContext context}
      ) async{
    var dio = Dio();
    try{
      var response = await dio.request(
        "$SERVER_URL/board",
        data: {
          'title': title,
          'content': content,
          'files': fileId != null ? [fileId] : []
        },
        options: Options(method:'POST'),
      );
      if(response.statusCode == 200){
        Navigator.popUntil(context, (route) => route.isFirst);
      }
    }catch(e){
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(
                  Icons.close_outlined,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  uploadImage(context);
                  print(_pickedImages.first?.path);
                },
                child: Text("전시하기"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  textStyle: textTheme.titleMedium,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                child: Text(
                  "사진을 추가해주세요.",
                  style: textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                    border: DashedBorder.fromBorderSide(
                      side: const BorderSide(color: Colors.white, width: 2),
                      dashLength: 15,
                    ),
                  ),
                  child: _pickedImages.isNotEmpty && _pickedImages.first != null
                      ? Stack(
                          children: [
                            Positioned.fill(
                              child: Image.file(
                                File(_pickedImages.first!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _pickedImages.clear();
                                  });
                                },
                                child: const Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        )
                      : IconButton(
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          icon:
                              SvgPicture.asset("assets/icons/camera_icon.svg"),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
