import 'dart:convert';
import 'package:bammulguan/server_url.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final Dio _dio = Dio();

  final String serverUrl = "$SERVER_URL/user";


  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(provisional: true);
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    _firebaseMessaging.getToken();
  }

  Future<void> sendFcmTokenToServer(String fcmToken) async {
    try {
      Map<String, dynamic> data = {
        'token': _firebaseMessaging.getToken(),
      };

      Response response = await _dio.post(
        serverUrl,
        data: json.encode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        print("200 OK");
      } else {
        print('Request failed: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}