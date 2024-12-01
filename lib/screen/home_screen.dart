import 'dart:convert';
import 'package:bammulguan/server_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bammulguan/screen/background_screen.dart';
import 'package:bammulguan/widget/image_board_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;  // 데이터 로딩 상태
  late String title;
  late String content;
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    fetchData();  // 서버에서 데이터 가져오기
  }

  // 서버에서 데이터 가져오기
  Future<void> fetchData() async {
    try {
      final dio = Dio();
      final response = await dio.get("$SERVER_URL/board");  // 서버 URL

      if (response.statusCode == 200) {
        final data = response.data;

        // 서버에서 가져온 데이터 처리
        setState(() {
          title = data['data'][3]['title'];  // 첫 번째 게시글
          content = data['data'][3]['content'];  // 첫 번째 게시글의 content

          // 이미지 URL 배열에서 첫 번째 요소만 사용
          imageUrl = data['data'][3]['imageUrl'] != null && data['data'][3]['imageUrl'].isNotEmpty
              ? data['data'][3]['imageUrl'][0]['url']  // 첫 번째 이미지 URL
              : '';  // 이미지가 없으면 빈 문자열 사용

          isLoading = false;  // 데이터 로딩 완료
        });
      } else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('데이터 가져오기 실패: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      child: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())  // 데이터 로딩 중
            : Align(
          alignment: Alignment.bottomCenter,
          child: imageUrl.isEmpty
              ? textBoard(title, content, context)  // 이미지가 없으면 textBoard를 보여줌
              : ImageBoardWidget(
            title: title,  // 서버에서 가져온 title
            content: content,  // 서버에서 가져온 content
            file: imageUrl,  // 서버에서 가져온 첫 번째 이미지 URL
          ),
        ),
      ),
    );
  }

  Widget textBoard(String title, String content, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 80, bottom: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textTheme.titleLarge),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
