import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Color color;
  Color? textColor;
  String text;
  Function() onPressed; // khởi tạo hàm

  CustomButton({super.key, required this.color, required this.text, required this.onPressed, this.textColor});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
          shadows: [
            Shadow(
              blurRadius: 4.0,
              offset: const Offset(0, 4),
              color: const Color(0xFF000000).withOpacity(.25)
            )
          ]
        ),
      )
    );
  }
}