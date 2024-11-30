import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

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
    // TODO: implement initState
    super.initState();
    print("가져온 데이터 ${widget.title}\n ${widget.content}");
  }
  final ImagePicker _picker = ImagePicker();
  final List<XFile?> _pickedImages = [];
  void getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    setState(() {
      _pickedImages.add(image);
    });
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
                Navigator.pop(context);
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
                Navigator.pop(context);
              },
              child: Text("전시 하기"),
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
            SizedBox(height: 60,),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 320,
                width: 320,
                decoration: BoxDecoration(
                    border: DashedBorder.fromBorderSide(
                        side: BorderSide(color: Colors.white, width: 2),
                        dashLength: 15)
                ),
                child: IconButton(onPressed: (){

                  getImage(ImageSource.gallery);
                }, icon: SvgPicture.asset("assets/icons/camera_icon.svg",)),
              ),
            )
          ],
        )
      ],
    ));
  }
}
