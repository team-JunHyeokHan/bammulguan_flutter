import 'dart:io';

import 'package:bammulguan/screen/background_screen.dart';
import 'package:bammulguan/widget/image_board_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면 높이를 계산

    return BackgroundScreen(
      child: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ImageBoardWidget(title: "title",content:  "ㅁㄴ이ㅏ러ㅏㅣㄴㅁ어리ㅏㅁ너리ㅏㅓㅁㄴ이라ㅓㄴ미;ㅏㅓㄹㅇ니;ㅏ", file: "/data/user/0/com.junhyoekhan.bammulguan/cache/957a80fb-4de8-4fec-93e9-5a4352d6a218/1000002830.jpg"),
              ),
            ),
          ),
        ),
    );
  }

  Widget textBoard(String title, String content, BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 80, bottom: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("지금 느낌", style: textTheme.titleLarge,),
          SizedBox(height: 20,),
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