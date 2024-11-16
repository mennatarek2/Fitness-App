import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';

class TapBotton extends StatelessWidget {
  final String icon;
  final String selecticon;
  final VoidCallback onTap;
  final bool isActive;
  const TapBotton(
      {super.key,
      required this.icon,
      required this.selecticon,
      required this.onTap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isActive ? selecticon : icon,
            width: 25,
            height: 25,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: isActive ? 8 : 12,
          ),
          if (isActive)
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: Tcolo.scandy),
                  borderRadius: BorderRadius.circular(2)),
            )
        ],
      ),
    );
  }
}
