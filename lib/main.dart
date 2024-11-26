import 'package:bammulguan/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Eulyoo", // 기본 폰트는 Eulyoo로 설정
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
          titleMedium: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
          titleSmall: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
          bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Pretendard'),
          bodyMedium: TextStyle(color: Colors.white, fontFamily: 'Pretendard'),
          bodySmall: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
          labelLarge: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
          labelMedium: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
          labelSmall: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
