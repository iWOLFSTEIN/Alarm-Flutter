import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main.dart';

class NotificationScheduler {
  static schedule(
      {var scheduledNotificationDateTime, var notificationBody}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      // 'alarm_notif',
      'warning',
      'Alarm notification',
      icon: '@mipmap/ic_launcher',
      playSound: true,
     importance: Importance.high,
     priority: Priority.high,
    

      sound: RawResourceAndroidNotificationSound('warning'),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
        //  sound: 'a_long_cold_sting.wav',

        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(0, 'Alarm', notificationBody,
        scheduledNotificationDateTime, platformChannelSpecifics);
  }
}
