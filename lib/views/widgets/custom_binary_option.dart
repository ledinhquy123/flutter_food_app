import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';

class CustomBinaryOption extends StatefulWidget {
  String textLeft;
  String textRight;

  CustomBinaryOption({required this.textLeft, required this.textRight});
  @override
  State<StatefulWidget> createState() => _CustomBinaryOptionState();
}

class _CustomBinaryOptionState extends State<CustomBinaryOption> {
  bool _left = true;
  bool _right = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                _left = !_left;
                _right = _left == true ? false : true;
              });
            },
            child: Column(
              children: [
                Text(
                  widget.textLeft,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: _left == true ? mainText : const Color(0xFF898A8D),
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 16),
                
                Container(
                  height: _left == true ? 3 : 1,
                  color: _left == true ? primary : outline,
                )
              ]
            ),
          )
        ),

        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                _right = !_right;
                _left = _right == true ? false : true;
              });
            },
            child: Column(
              children: [
                Text(
                  widget.textRight,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: _right == true ? mainText : const Color(0xFF898A8D),
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 16),
                
                Container(
                  height: _right == true ? 3 : 1,
                  color: _right == true ? primary : outline,
                )
              ]
            ),
          )
        ),
      ],
    );
  }
}