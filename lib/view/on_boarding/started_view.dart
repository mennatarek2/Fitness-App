import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/round_bottom.dart';
import 'package:fitness_app/view/on_boarding/on_boarding_view.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                    colors: Tcolo.primary,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                : null),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Fitnest',
              style: TextStyle(
                  color: Tcolo.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Everybody Can Train',
              style: TextStyle(
                color: Tcolo.gray,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 21),
                  child: RoundBottom(
                      title: 'Get Started',
                      Type: isChangeColor
                          ? RoundedBottunType.TextbgGradient
                          : RoundedBottunType.bgGradient,
                      onPressed: () {
                        if (isChangeColor) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OnBoardingView()));
                        } else {
                          setState(() {
                            isChangeColor = true;
                          });
                        }
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
