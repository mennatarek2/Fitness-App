import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/round_bottom.dart';
import 'package:fitness_app/view/main_tap/main_tap_view.dart';

class WelcomView extends StatefulWidget {
  const WelcomView({super.key});

  @override
  State<WelcomView> createState() => _WelcomViewState();
}

class _WelcomViewState extends State<WelcomView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/img/Group.png',
                width: media.width * 0.8,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Text(
                'Welcome, Stefani',
                style: TextStyle(
                    color: Tcolo.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'You are all set now, let’s reach your\ngoals together with us',
                textAlign: TextAlign.center,
                style: TextStyle(color: Tcolo.gray, fontSize: 12),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              const Spacer(),
              RoundBottom(
                  title: 'Go To Home',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainTapView(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
