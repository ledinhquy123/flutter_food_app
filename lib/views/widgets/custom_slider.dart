import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';

class CustomSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double slider = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Cooking Duration ',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: mainText
              ),
            ),
            Text(
              '(in minutes)',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: secondaryText
              ),
            ),
          ],
        ),

        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '<10',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: primary
                  ),
                ),

                Text(
                  '30',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: primary
                  ),
                ),

                Text(
                  '>60',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: primary
                  ),
                ),
              ],
            ),

            SliderTheme(
              data: const SliderThemeData(
                trackHeight: 8.0 // Chỉnh độ dày của thanh slider
              ), 
              child: Slider(
                divisions: 2, // Xác định các bước (khoảng cách giữa min max 10 - 30 - 60)
                max: 60.0,
                min: 10.0,
                value: slider, 
                thumbColor: primary, // Dấu chấm
                activeColor: primary, // Đoạn được đi chuyển
                inactiveColor: form,
                onChanged: (value) {
                  setState(() {
                    slider = value;
                  });
                }
              )
            )
            
          ],
        )
      ],
    );
  }
}