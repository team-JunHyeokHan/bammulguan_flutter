import 'package:flutter/material.dart';

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
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Text(
            "사진을 추가해주세요.",
            style: textTheme.headlineSmall,
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
        )
      ],
    ));
  }
}
