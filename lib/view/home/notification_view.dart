import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/notification_row.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List notificationArr = [
    {
      'image': 'assets/img/Workout-Pic.png',
      'title': 'Hey, it’s time for lunch',
      'time': 'About 1 minutes ago',
    },
    {
      'image': 'assets/img/Workout-Pic (1).png',
      'title': 'Don’t miss your lowerbody workout',
      'time': 'About 3 minutes ago',
    },
    {
      'image': 'assets/img/Workout3.png',
      'title': 'Hey, let’s add some meals for your b..',
      'time': 'About 3 minutes ago',
    },
    {
      'image': 'assets/img/Workout-Pic.png',
      'title': 'Congratulations, You have finished A..',
      'time': '29 May',
    },
    {
      'image': 'assets/img/Workout-Pic (1).png',
      'title': 'Hey, it’s time for lunch',
      'time': '8 April',
    },
    {
      'image': 'assets/img/Workout3.png',
      'title': 'Ups, You have missed your Lowerbo...',
      'time': '3 April',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolo.white,
      appBar: AppBar(
        backgroundColor: Tcolo.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Tcolo.LightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              'assets/img/black_btn.png',
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Notification',
          style: TextStyle(
              color: Tcolo.black, fontWeight: FontWeight.w700, fontSize: 17),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Tcolo.LightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'assets/img/more_btn.png',
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          itemBuilder: (context, index) {
            var nObj = notificationArr[index] as Map? ?? {};
            return NotificationRow(nObj: nObj);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Tcolo.gray.withOpacity(0.5),
              height: 1,
            );
          },
          itemCount: notificationArr.length),
    );
  }
}
