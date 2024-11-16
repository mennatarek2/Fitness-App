import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/common_widget/error_dialog.dart';
import 'package:fitness_app/view/main_tap/main_tap_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/round_bottom.dart';
import 'package:fitness_app/common_widget/round_text_feld.dart';

import '../home/global.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hay There',
                  style: TextStyle(color: Tcolo.gray, fontSize: 16),
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: Tcolo.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.08,
                ),
                RoundTextFeld(
                  hintText: ' Email',
                  controller: emailController,
                  icon: 'assets/img/Message.png',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                RoundTextFeld(
                  hintText: ' Password',
                  icon: 'assets/img/Lock.png',
                  obscureText: true,
                  controller: passwordController,
                  rigticon: TextButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'assets/img/Hide.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: Tcolo.gray,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                            color: Tcolo.gray,
                            fontSize: 10,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.75,
                ),
                RoundBottom(
                    title: 'Login',
                    onPressed: () {
                      formValidation();
                    }),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Tcolo.gray.withOpacity(0.5),
                    )),
                    Text(
                      '  or  ',
                      style: TextStyle(color: Tcolo.black, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Tcolo.gray.withOpacity(0.5),
                    )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Tcolo.white,
                            border: Border.all(
                              width: 1,
                              color: Tcolo.gray.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                          'assets/img/google.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Tcolo.white,
                            border: Border.all(
                              width: 1,
                              color: Tcolo.gray.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                          'assets/img/facebook.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account yet?',
                        style: TextStyle(
                          color: Tcolo.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                            color: Tcolo.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> authlogin() async {
    User? currentUser;
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });
    if (currentUser != null) {
      readDataLocally(currentUser!);
    }
  }

  Future readDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        await sharedPreferences!.setString("uid", currentUser.uid);
        await sharedPreferences!.setString("email", snapshot.data()!["email"]);
        await sharedPreferences!
            .setString("name", snapshot.data()!["first_name"]);
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const MainTapView()));
      } else {
        firebaseAuth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const LoginView()));
        // show Dialog
        showDialog(
          context: context,
          builder: (c) {
            return const ErrorDialog(
              message: 'no record exists',
            );
          },
        );
      }
    });
  }
  formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // login
      authlogin();
      Route newRoute = MaterialPageRoute(builder: (context)=> const MainTapView());
      Navigator.pushReplacement(context, newRoute);
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return const ErrorDialog(
              message: 'Please write email/ password',
            );
          });
    }
  }
}
