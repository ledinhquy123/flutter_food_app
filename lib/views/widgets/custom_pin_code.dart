import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class CustomPinCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomPinCodeState();
}

class _CustomPinCodeState extends State<CustomPinCode> {

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      maxLength: 4,
      pinBoxHeight: 70,
      pinBoxWidth: 70,
      wrapAlignment: WrapAlignment.center,
      pinBoxRadius: 20,
      defaultBorderColor: const Color(0xFFD0DBEA),
      hasTextBorderColor: primary,
      pinTextStyle: const TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w600,
        color: Color(0xFF3E5481)
      ),

      pinBoxBorderWidth: 2,
      onTextChanged: (value){

      },
    );
  }
}