import 'package:alarm_app/NotificationScheduler.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: ListTile(
          onTap: () async {
            

            var time = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());


            // in case if picker is not cancelled 
            if (time != null) {


            // the notification schedule function take DateTime object while TimePicker returns
            // TimeOfDay object so here is TimeOfDay is converted to DateTime 
              var currentDateTime = DateTime.now();
              var settime = DateTime(
                currentDateTime.year,
                currentDateTime.month,
                currentDateTime.day,
                time.hour,
                time.minute,
              );


              // Schedule a notification with specific time and message 
              NotificationScheduler.schedule(
                  scheduledNotificationDateTime: settime,
                  notificationBody:
                      "Alarm for ${time.hour % 12}:${time.minute}");
            }
          },
          leading: Icon(Icons.alarm),
          title: Text(
            "Set Alarm",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.green.shade300),
          ),
        ),
      ),
    );
  }
}
