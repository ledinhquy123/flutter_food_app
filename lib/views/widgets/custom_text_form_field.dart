import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:iconly/iconly.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextInputType? inputType;
  bool obscureText;
  Function()? onPressedSuffixIcon;
  String? Function(String?)? validator; // Hàm trả về string, truyền dữ liệu kiểu string vào
  void Function(String)? onChanged;
  bool filled;
  InputBorder? border;
  bool enabled;
  TextEditingController? controller;
  Function()? onEditingComplete;

  CustomTextFormField({
    super.key, this.hintText, 
    this.prefixIcon, 
    this.suffixIcon, 
    this.inputType, 
    this.onPressedSuffixIcon, 
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.filled = false,
    this.border,
    this.enabled = true,
    this.controller,
    this.onEditingComplete
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: inputType,
      controller: controller,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            width: 1,
            color: outline
          ),
        ),
        
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            width: 2,
            color: primary
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red
          ),
        ),

        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: secondaryText
        ),

        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black,
        ),

        suffixIcon: IconButton(
         icon: Icon(
          suffixIcon,
          color: secondaryText,
         ),
         onPressed: onPressedSuffixIcon,
        ),

        filled: filled,
        border: border,
        enabled: enabled
      ),
    );
  }
}