import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';

class NotificationRow extends StatelessWidget {
  final Map nObj;
  const NotificationRow({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              nObj['image'].toString(),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nObj['title'].toString(),
                style: TextStyle(
                    color: Tcolo.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Text(nObj['time'].toString(),
                  style: TextStyle(
                    color: Tcolo.gray,
                    fontSize: 10,
                  )),
              const SizedBox(
                height: 4,
              ),
            ],
          )),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/img/sub_menu.png',
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
