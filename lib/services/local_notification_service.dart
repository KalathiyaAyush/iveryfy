// ignore_for_file: use_build_context_synchronously

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iverify/services/pref/pref_service.dart';

import '../src/resources/routes_manager.dart';


class LocalNotificationService {
  LocalNotificationService._();

  static final LocalNotificationService instance = LocalNotificationService._();

  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  Future<void> init() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  void selectNotification(String? payload) async {
    final token =
        PreferenceService.instance.getStringPrefValue(key: PrefKeys.token);
    var context = RouteGenerator.navigatorKey.currentContext;
    if (context != null && token.isNotEmpty) {
      AppRoutes.popUntil(context, name: AppRoutes.splashScreen);
    }
  }

  Future<void> showNotification(
      {String? title, String? body, String? payload}) async {
    var android = const AndroidNotificationDetails(
      '1',
      'APP Name',
      channelDescription: 'CHANNEL DESCRIPTION',
      priority: Priority.high,
      importance: Importance.max,
    );

    var iOS = const IOSNotificationDetails();
    var plateform = NotificationDetails(iOS: iOS, android: android);
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      plateform,
      payload: payload,
    );
  }
}
