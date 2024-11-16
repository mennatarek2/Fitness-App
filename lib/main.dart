import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:get/get.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fitness 3 in 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Tcolo.primarycolor1,
          useMaterial3: true,
          fontFamily: 'Poppins'),
      home: const LoginView(),
    );
  }
}
