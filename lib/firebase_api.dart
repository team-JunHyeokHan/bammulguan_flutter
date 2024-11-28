
import 'package:firebase_messaging/firebase_messaging.dart';


class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission(provisional: true);
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final FcmToken = await _firebaseMessaging.getToken();

    print("tokendd: $FcmToken");
  }
}