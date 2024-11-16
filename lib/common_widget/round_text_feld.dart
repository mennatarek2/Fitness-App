import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';

class RoundTextFeld extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final String icon;
  final bool obscureText;
  final EdgeInsets? margin;
  final Widget? rigticon;
  const RoundTextFeld(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.controller,
      this.margin,
      this.keyboardType,
      this.obscureText = false,
      this.rigticon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
            color: Tcolo.LightGray,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            suffixIcon: rigticon,
            prefixIcon: Container(
              alignment: Alignment.center,
              width: 20,
              height: 20,
              child: Image.asset(
                icon,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
                color: Tcolo.gray,
              ),
            ),
            hintStyle: TextStyle(color: Tcolo.gray, fontSize: 16),
          ),
        ));
  }
}
