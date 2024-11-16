import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/common_widget/error_dialog.dart';
import 'package:fitness_app/common_widget/loading_dialog.dart';
import 'package:fitness_app/view/home/global.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/round_bottom.dart';
import 'package:fitness_app/common_widget/round_text_feld.dart';
import 'package:fitness_app/view/login/complete_profil_view.dart';
import 'package:fitness_app/view/login/login_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailco = TextEditingController();
  TextEditingController passwordco = TextEditingController();
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hay There',
                    style: TextStyle(color: Tcolo.gray, fontSize: 16),
                  ),
                  Text(
                    'Create an Account',
                    style: TextStyle(
                        color: Tcolo.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: media.width * 0.08,
                  ),
                   RoundTextFeld(
                    hintText: 'First Name',
                    controller: firstName,
                    icon: 'assets/img/Profile.png',
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                   RoundTextFeld(
                    hintText: 'Last Name',
                    controller: lastName,
                    icon: 'assets/img/Profile.png',
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                   RoundTextFeld(
                    hintText: ' Email',
                    controller: emailco,
                    icon: 'assets/img/Message.png',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundTextFeld(
                    hintText: ' Password',
                    icon: 'assets/img/Lock.png',
                    controller: passwordco,
                    obscureText: true,
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
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          icon: Icon(
                            isChecked
                                ? Icons.check_box_outlined
                                : Icons.check_box_outline_blank_outlined,
                            color: Tcolo.gray,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'By continuing you accept our Privacy Policy and \nTerm of Use',
                          style: TextStyle(color: Tcolo.gray, fontSize: 10),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.4,
                  ),
                  RoundBottom(
                      title: 'Register',
                      onPressed: () {
                        fromValidation();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CompleteProfilView(),
                            ));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Tcolo.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          ' Login',
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
      ),
    );
  }

  void authenticateAndSignUp() async {
    User? currentUser;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailco.text.trim(), password: passwordco.text.trim())
        .then((auth) {
      currentUser = auth.user;
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
    if(currentUser != null){
      saveDataToFirebase(currentUser!).then((value) {
          Navigator.pop(context);
          Route newRoute = MaterialPageRoute(builder: (c)=> const CompleteProfilView());
          Navigator.pushReplacement(context, newRoute);
      });
    }
  }

  Future saveDataToFirebase(User currentUser) async {
    FirebaseFirestore.instance.collection('users').doc(currentUser.uid).set({
      "first_name": firstName.text.trim(),
      "user_Uid": currentUser.uid,
      "last_name": lastName.text.trim(),
      "email": currentUser.email,
      "pasword": passwordco.text.trim()
    });
  }

  Future<void> fromValidation() async {
    if (firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        emailco.text.isNotEmpty &&
        passwordco.text.isNotEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return const LoadingDialog(
              message: 'Registering Account',
            );
          });
          authenticateAndSignUp();
    }else{
      showDialog(context: context, builder: (c){
          return const ErrorDialog(
            message: 'Please write the complete required info for Registeration',
          );
      });
    }
  }
}
