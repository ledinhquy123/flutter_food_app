import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';

class CustomTextFieldInUpload extends StatelessWidget {
  int? maxLine;
  IconData? icon;
  String? hint;
  double radius;

  CustomTextFieldInUpload({
    this.maxLine, 
    this.icon, 
    this.hint,
    this.radius = 10
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      decoration: InputDecoration(
        icon: icon == null ? null : Icon(icon),
        iconColor: secondaryText,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: secondaryText
        ),
        focusedBorder: OutlineInputBorder( // Khi click vào
          borderRadius: BorderRadius.all(
            Radius.circular(radius)
          ),
          borderSide: const BorderSide(
            color: primary
          )
        ),

        enabledBorder: OutlineInputBorder( // Khi chưa click vào
          borderRadius: BorderRadius.all(
            Radius.circular(radius)
          ),
          borderSide: const BorderSide(
            color: outline
          )
        ),

      ),
    );
  }
}