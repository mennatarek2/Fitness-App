import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/common_widget/error_dialog.dart';
import 'package:fitness_app/common_widget/loading_dialog.dart';
import 'package:fitness_app/view/main_tap/main_tap_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/round_bottom.dart';
import 'package:fitness_app/common_widget/round_text_feld.dart';
import 'package:fitness_app/view/login/what_your_goal_view.dart';

class CompleteProfilView extends StatefulWidget {
  const CompleteProfilView({super.key});

  @override
  State<CompleteProfilView> createState() => _CompleteProfilViewState();
}

class _CompleteProfilViewState extends State<CompleteProfilView> {
  TextEditingController txtDate = TextEditingController();
  TextEditingController yourWeight = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController yourHeight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/Vector-Section.png',
                    width: media.width,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    height: media.width * 0.08,
                  ),
                  Text(
                    'Let’s complete your profile',
                    style: TextStyle(
                        color: Tcolo.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'It will help us to know more about you!',
                    style: TextStyle(color: Tcolo.gray, fontSize: 16),
                  ),
                  SizedBox(
                    height: media.width * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Tcolo.LightGray,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Image.asset(
                                  'assets/img/2 User.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                  color: Tcolo.gray,
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    items: ['Male', 'Female']
                                        .map((name) => DropdownMenuItem(
                                              value: name,
                                              child: Text(
                                                name,
                                                style: TextStyle(
                                                    color: Tcolo.gray,
                                                    fontSize: 16),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      value = 'Male';
                                    },
                                    isExpanded: true,
                                    hint: Text(
                                      'Choose Gender',
                                      style: TextStyle(
                                          color: Tcolo.gray, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        RoundTextFeld(
                          controller: txtDate,
                          hintText: 'Date of Birth',
                          icon: 'assets/img/Calendar.png',
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundTextFeld(
                                controller: yourWeight,
                                hintText: 'Your Weight',
                                icon: 'assets/img/weight-scale 1.png',
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient:
                                      LinearGradient(colors: Tcolo.scandy),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                'KG',
                                style:
                                    TextStyle(color: Tcolo.white, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: media.width * 0.04,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundTextFeld(
                                controller: yourHeight,
                                hintText: 'Your Height',
                                icon: 'assets/img/Swap.png',
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient:
                                      LinearGradient(colors: Tcolo.scandy),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                'CM',
                                style:
                                    TextStyle(color: Tcolo.white, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: media.width * 0.07,
                        ),
                        RoundBottom(
                            title: 'Next >',
                            onPressed: () {
                              fromValidation();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainTapView()));
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  User? currentUser;
  Future saveDataUser(User currentUser) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .collection('data')
        .doc(currentUser.uid)
        .set({
      "user_Uid": currentUser.uid,
      "email": currentUser.email,
      "gender": "Male",
      "date": 30 / 09 / 2024,
      "weight": yourWeight.text.trim(),
      "height": yourHeight.text.trim(),
    });
  }

  Future<void> fromValidation() async {
    if (txtDate.text.isNotEmpty &&
        yourWeight.text.isNotEmpty &&
        yourHeight.text.isNotEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return const LoadingDialog(
              message: 'Register Data',
            );
          });
      if (currentUser != null) {
        saveDataUser(currentUser!).then((value) {
          Navigator.pop(context);
          Route newRoute =
              MaterialPageRoute(builder: (c) => const WhatYourGoalView());
          Navigator.pushReplacement(context, newRoute);
        });
      }
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return const ErrorDialog(
              message:
                  'Please write the complete required info for Registeration',
            );
          });
    }
  }
}
