// ignore_for_file: use_build_context_synchronously

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:iverify/services/pref/pref_service.dart';

import '../src/resources/routes_manager.dart';
import '../src/utils/utility_helper.dart';
import 'local_notification_service.dart';


class FirebaseMessagingService {
  FirebaseMessagingService._();

  static FirebaseMessagingService instance = FirebaseMessagingService._();

  late final FirebaseMessaging _messaging;

  Future<void> init() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();
    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;
    getToken();

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        UtilityHelper.showLog('**onMessage** Called');
        if (message.notification?.title != null) {
          LocalNotificationService.instance.showNotification(
            title: message.notification?.title,
            body: message.notification?.body,
          );
        }
      });

      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);

      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) async {
        UtilityHelper.showLog('**onMessageOpenedApp** Called');

        final token =
            PreferenceService.instance.getStringPrefValue(key: PrefKeys.token);
        var context = RouteGenerator.navigatorKey.currentContext;
        if (context != null && token.isNotEmpty) {
          AppRoutes.popUntil(context, name: "routenamepass");
        }
      });
    } else {
      // UtilityHelper.showLog(
      //   'Messaging Permission -> User declined or has not accepted permission',
      // );
    }
  }

  Future<String?> getToken() async {
    final fcmToken = await _messaging.getToken();
    // UtilityHelper.showLog('FCMToken $fcmToken');
    return fcmToken;
  }
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  UtilityHelper.showLog(
      'MessageID Handling a background message: ${message.messageId}');
}
