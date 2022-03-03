import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main.dart';

class NotificationScheduler {
  static schedule(
      {var scheduledNotificationDateTime,
      var notificationBody,
      int? channelId,
      // String? channelName
      }) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      
      'warning',
      'Alarm notification',
      icon: '@mipmap/ic_launcher',
      playSound: true,
      importance: Importance.high,
      priority: Priority.high,
      //  fullScreenIntent: true,
      // enableLights: true,
      // ledOnMs: 500,
     
      

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

    await flutterLocalNotificationsPlugin.schedule(channelId!, 'Alarm', notificationBody,
        scheduledNotificationDateTime, platformChannelSpecifics);
  }
}
