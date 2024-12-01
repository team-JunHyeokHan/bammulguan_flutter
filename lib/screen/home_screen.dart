import 'package:bammulguan/screen/background_screen.dart';
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
              child: Center(
                child: textPost("title", "ㅁㄴ이ㅏ러ㅏㅣㄴㅁ어리ㅏㅁ너리ㅏㅓㅁㄴ이라ㅓㄴ미;ㅏㅓㄹㅇ니;ㅏ", context),
              ),
            ),
          ),
        ),
    );
  }

  Widget textPost(String title, String content, BuildContext context){
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