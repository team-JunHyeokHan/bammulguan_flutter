import 'dart:async';

import 'package:bammulguan/screen/background_screen.dart';
import 'package:bammulguan/screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_api.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
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
          headlineSmall: TextStyle(color: Colors.white, fontFamily: 'Eulyoo_SemiBold'),
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
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isAfterOneAM = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);

    _checkTime();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  void _checkTime() {
    Timer(Duration(seconds: 1), () {
      final now = DateTime.now();
      if (now.hour == 1) {
        setState(() {
          isAfterOneAM = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BackgroundScreen(
        child: isAfterOneAM
            ? _buildSplashAfterOneAM()
            : _buildSplashBeforeOneAM(),
      ),
    );
  }

  Widget _buildSplashAfterOneAM() {
    return _buildAnimatedText();
  }

  Widget _buildSplashBeforeOneAM() {
    return _buildAnimateText();
  }

  Widget _buildAnimateText() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '밤물관',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Eulyoo',
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '밤에 피는 박물관',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Eulyoo',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildAnimatedText() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '밤물관',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Eulyoo',
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '밤물관 개관시간이 아니예요.'
                '다음에 또 와주세요.',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Eulyoo',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
