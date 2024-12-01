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
            headlineSmall:
                TextStyle(color: Colors.white, fontFamily: 'Eulyoo_SemiBold'),
            titleLarge: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
            titleMedium: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
            titleSmall: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
            bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Pretendard'),
            bodyMedium:
                TextStyle(color: Colors.white, fontFamily: 'Pretendard'),
            bodySmall: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
            labelLarge: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
            labelMedium: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
            labelSmall: TextStyle(color: Colors.white, fontFamily: 'Eulyoo'),
          ),
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: Colors.white)),
      home: HomeScreen(),
    );
  }
}
