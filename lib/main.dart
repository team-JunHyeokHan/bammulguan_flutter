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
          fontFamily: "Eulyoo",
            textTheme: TextTheme(
              bodyLarge:
              TextStyle(color: Colors.black, fontFamily: 'Pretendard'),
                bodyMedium:
                    TextStyle(color: Colors.black, fontFamily: 'Pretendard'))),
        home: HomeScreen());
  }
}
