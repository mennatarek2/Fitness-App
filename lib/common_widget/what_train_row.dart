 import 'package:flutter/material.dart';
import 'package:fitness_app/common_widget/round_bottom.dart';

 import 'package:fitness_app/common/colo_exetion.dart';

class WhatTrainRow extends StatelessWidget {
  final Map wObj;
  const WhatTrainRow({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Tcolo.primarycolor2.withOpacity(0.3),
              Tcolo.primarycolor1.withOpacity(0.3)
            ]),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wObj["title"].toString(),
                      style: TextStyle(
                          color: Tcolo.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${wObj["exercises"].toString()} | ${ wObj["time"].toString() }" ,
                      style: TextStyle(
                        color: Tcolo.gray,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: RoundBottom(
                          title: "View More",
                          fontsize: 10,
                          Type: RoundedBottunType.TextbgGradient,
                           fontWeight: FontWeight.w400,
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.54),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      wObj["image"].toString(),
                      width: 90,
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
