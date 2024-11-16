import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';

enum RoundedBottunType { bgGradient, bgSGradient, TextbgGradient }

class RoundBottom extends StatelessWidget {
  final String title;
  final RoundedBottunType Type;
  final VoidCallback onPressed;
  final double fontsize;
  final FontWeight fontWeight;
  const RoundBottom(
      {super.key,
      required this.title,
      this.Type = RoundedBottunType.bgGradient,
      required this.onPressed,
      this.fontsize = 16,
      this.fontWeight = FontWeight.w700});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: Type == RoundedBottunType.bgSGradient
                  ? Tcolo.scandy
                  : Tcolo.primary,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          boxShadow: Type == RoundedBottunType.bgGradient ||
                  Type == RoundedBottunType.bgSGradient
              ? [
                  const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.5,
                      offset: Offset(0, 0.5))
                ]
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        textColor: Tcolo.primarycolor1,
        elevation: Type == RoundedBottunType.bgGradient ||
                Type == RoundedBottunType.bgSGradient
            ? 0
            : 1,
        color: Type == RoundedBottunType.bgGradient ||
                Type == RoundedBottunType.bgSGradient
            ? Colors.transparent
            : Tcolo.white,
        minWidth: double.maxFinite,
        child: Type == RoundedBottunType.bgGradient ||
                Type == RoundedBottunType.bgSGradient
            ? Text(
                title,
                style: TextStyle(
                    color: Tcolo.white,
                    fontWeight: fontWeight,
                    fontSize: fontsize),
              )
            : ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                          colors: Tcolo.primary,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)
                      .createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                child: Text(
                  title,
                  style: TextStyle(
                      color: Tcolo.primarycolor1,
                      fontWeight: fontWeight,
                      fontSize: fontsize),
                ),
              ),
      ),
    );
  }
}
