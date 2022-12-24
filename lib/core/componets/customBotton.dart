import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? buttonWidth;
  final double? height;
  final double? fontSize;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.buttonWidth,
      this.height,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        height: height ?? 50,
        width: buttonWidth ?? width * 0.3,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'ACaslonPro Bold',
          ),
        ),
      ),
    );
  }
}
