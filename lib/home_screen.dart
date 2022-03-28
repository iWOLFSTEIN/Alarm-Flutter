// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../notification_scheduler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  clock() async {
    var time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    // in case if picker is not cancelled
    if (time != null) {
      // the notification schedule function take DateTime object while TimePicker returns
      // TimeOfDay object so here is TimeOfDay is converted to DateTime
      var currentDateTime = DateTime.now();
      var day = currentDateTime.day + 1;

      if (currentDateTime.hour < time.hour) {
        day = currentDateTime.day;
      } else if (currentDateTime.hour == time.hour) {
        if (currentDateTime.minute < time.minute) {
          day = currentDateTime.day;
        }
      }
      var settime = DateTime(
        currentDateTime.year,
        currentDateTime.month,
        day,
        time.hour,
        time.minute,
      );
      print(
          "Alarm Time is $day/${currentDateTime.month}/${currentDateTime.year} at ${time.hour}:${time.minute}");
      int id = currentDateTime.millisecondsSinceEpoch;

      // Schedule a notification with specific time and message
      NotificationScheduler.schedule(
        scheduledNotificationDateTime: settime,
        notificationBody: "Alarm for ${time.hour % 12}:${time.minute}",
        channelId: (id % 10000000).toInt(),
      );
      // add(currentDateTime);
    }
  }

  // add(DateTime currentDateTime) async {
  //   counter = counter + 1;
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('alarm$counter', '$currentDateTime');
  //   print('Mehdi');
  //   print(prefs.getString('alarm1'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ListTile(
              onTap: clock,
              leading: const Icon(
                Icons.alarm,
                color: Colors.white,
              ),
              title: const Text(
                "Set Alarm",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
