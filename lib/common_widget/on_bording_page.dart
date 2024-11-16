import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';

class OnBordingPage extends StatelessWidget {
  final Map pObj;
  const OnBordingPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
        child: SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            pObj['image'].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: media.width * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              pObj['title'].toString(),
              style: TextStyle(
                  color: Tcolo.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              pObj['subtitle'].toString(),
              style: TextStyle(
                color: Tcolo.gray,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
