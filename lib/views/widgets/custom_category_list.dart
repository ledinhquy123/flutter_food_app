import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';

class CustomCategoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomCategoryListState();
}

class _CustomCategoryListState extends State<CustomCategoryList> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category', 
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Color(0xFF3E5481)
          ),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            menuButton(
              width: _index == 0 ? 65 : 85, 
              text: 'All',
              color: _index == 0 ? primary : form, 
              textColor: _index == 0 ? Colors.white : secondaryText,
              onTap: () {
                setState(() {
                  _index = 0;
                });
              }
            ),
            
            menuButton(
              width: _index == 1 ? 65 : 85, 
              text: 'Food', 
              color: _index == 1 ? primary : form, 
              textColor: _index == 1 ? Colors.white : secondaryText,
              onTap: () {
                setState(() {
                  _index = 1;
                });
              }
            ),

            menuButton(
              width: _index == 2 ? 65 : 85, 
              text: 'Drink', 
              color: _index == 2 ? primary : form,
              textColor: _index == 2 ? Colors.white : secondaryText,
              onTap: () {
                setState(() {
                  _index = 2;
                });
              }
            ),
          ],
        )
      ],
    );
  }

  menuButton({
    required double width, 
    required String text, 
    required Color color,
    required Color textColor,
    required void Function() onTap
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(32)
          )
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: textColor
          ),
        ),
      )
    );
  }
}