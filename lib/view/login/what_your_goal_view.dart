import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/round_bottom.dart';
import 'package:fitness_app/view/login/welcom_view.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  List goalArr = [
    {
      'image': 'assets/img/Vector.png',
      'title': 'Improve Shape',
      'subtitle':
          'I have a low amount of body fat\nand need / want to build more\nmuscle'
    },
    {
      'image': 'assets/img/Vector (1).png',
      'title': 'Lean & Tone',
      'subtitle':
          'I’m “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way'
    },
    {
      'image': 'assets/img/Vector (3).png',
      'title': 'Lose a Fat',
      'subtitle':
          'I have over 20 lbs to lose. I want to\ndrop all this fat and gain\nmuscle mass'
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: CarouselSlider(
                items: goalArr
                    .map((gObj) => Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: Tcolo.primary,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25)),
                          padding: EdgeInsets.symmetric(
                              vertical: media.width * 0.1, horizontal: 25),
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Column(
                              children: [
                                Image.asset(
                                  gObj['image'].toString(),
                                  width: media.width * 0.6,
                                  fit: BoxFit.fitWidth,
                                ),
                                SizedBox(
                                  height: media.width * 0.1,
                                ),
                                Text(
                                  gObj['title'].toString(),
                                  style: TextStyle(
                                      color: Tcolo.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width: media.width * 0.2,
                                  height: 1,
                                  color: Tcolo.white,
                                ),
                                SizedBox(
                                  height: media.width * 0.02,
                                ),
                                Text(
                                  gObj['subtitle'].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Tcolo.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 0.75,
                  initialPage: 0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.08,
                  ),
                  Text(
                    'What is your goal ?',
                    style: TextStyle(
                        color: Tcolo.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'It will help us to choose a best\nprogram for you',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Tcolo.gray, fontSize: 12),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  const Spacer(),
                  RoundBottom(
                      title: 'Confirm',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomView(),
                            ));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
