import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
   
  static FlutterLocalNotificationsPlugin _notificationService =
      FlutterLocalNotificationsPlugin();

  static Future showNotification({required String message}) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/pngegg');
    var initializationSettingsIOS = DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      linux: LinuxInitializationSettings(defaultActionName: 'oooo'),
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    _notificationService = FlutterLocalNotificationsPlugin();

    WidgetsFlutterBinding.ensureInitialized();

    _notificationService.initialize(
      initializationSettings,
    );
    int rndmIndex = Random().nextInt(23);

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
         playSound:true,sound: RawResourceAndroidNotificationSound('message_notification'),
       icon: '',
      '$rndmIndex.0',
      'تطبيق المسلم',
      channelDescription: message,
      importance: Importance.max,
      priority: Priority.high,
       enableVibration: true,
    );
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails(
      threadIdentifier: 'thread_id',
    );
    var platformChannelSpecifics = NotificationDetails(
        linux: LinuxNotificationDetails(  sound:  AssetsLinuxSound('assets/sound/message_notification.mp3',),
          icon: AssetsLinuxIcon(''),
        ),
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    _notificationService.initialize(initializationSettings,onDidReceiveNotificationResponse: (details) {
      
    },);
    await _notificationService.show(
      rndmIndex,
      'فَذَكِّرْ',
      message,
      platformChannelSpecifics,
    );
   }
}
