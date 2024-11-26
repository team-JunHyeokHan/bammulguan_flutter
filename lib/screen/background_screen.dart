import 'dart:math';
import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;
  final int numberOfContainers;

  const BackgroundScreen({
    super.key,
    required this.child,
    this.numberOfContainers = 70,
  });

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final textTheme = Theme.of(context).textTheme;

    // 화면 크기 정보를 얻기 위해 MediaQuery 사용
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // 랜덤 위치의 Container 리스트 생성
    List<Widget> generateRandomContainers() {
      return List.generate(numberOfContainers, (_) {
        // 랜덤 위치 계산
        final double left = random.nextDouble() * screenWidth;
        final double top = random.nextDouble() * screenHeight;

        return Positioned(
          left: left,
          top: top,
          child: Container(
            width: 2,
            height: 2,
            decoration: BoxDecoration(
              color: Color(0xFFDDF2FF),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        );
      });
    }

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("밤물관", style: textTheme.titleLarge),
                    Text("아이콘"),
                  ],
                ),
              ),
            ),
            // 랜덤 Container를 포함한 리스트
            ...generateRandomContainers(),
            child, // 사용자 지정 콘텐츠
          ],
        ),
      ),
    );
  }
}
