import 'package:BuildTek/config/logger_config.dart';
import 'package:BuildTek/services/storage/store_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize Firebase
  Future<void> initFirebase() async {
    await Firebase.initializeApp();
  }

  // function to initialize notification
  Future<void> initNotification() async {
    if (kIsWeb) {
      await _initWebNotification();
    } else {
      await _initMobileNotification();
    }
  }

  // function to initialize mobile notification
  Future<void> _initMobileNotification() async {
    // request permission from user
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    logger.i('User granted permission: ${settings.authorizationStatus}');

    // get the token
    final fcmToken = await _firebaseMessaging.getToken();
    logger.i('FCM Token: $fcmToken');

    if (fcmToken != null) {
      StoreService.storeFcmToken(fcmToken);
    }

    // handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      logger.i('A new onMessageOpenedApp event was published!');
      logger.i('Message data: ${message.data}');

      if (message.notification != null) {
        logger.i(
            'Message also contained a notification: ${message.notification}');
      }
    });
  }

  // function to initialize web notification
  Future<void> _initWebNotification() async {
    // request permission from user
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    logger.i('User granted permission: ${settings.authorizationStatus}');

    // get the token
    final fcmToken = await _firebaseMessaging.getToken(vapidKey: 'YOUR_WEB_PUSH_CERTIFICATE_KEY_PAIR');
    logger.i('FCM Token: $fcmToken');

    if (fcmToken != null) {
      StoreService.storeFcmToken(fcmToken);
    }

    // handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.i('Received a message while in the foreground!');
      logger.i('Message data: ${message.data}');

      if (message.notification != null) {
        logger.i(
            'Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      logger.i('A new onMessageOpenedApp event was published!');
      logger.i('Message data: ${message.data}');

      if (message.notification != null) {
        logger.i(
            'Message also contained a notification: ${message.notification}');
      }
    });
  }

  // background message handler
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    logger.i('Handling a background message: ${message.messageId}');
  }
}
