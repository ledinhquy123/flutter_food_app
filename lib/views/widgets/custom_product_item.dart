import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/datas/food_data.dart';
import 'package:food_app_yt/models/food.dart';
import 'package:food_app_yt/views/screens/product_item_screen.dart';
import 'package:food_app_yt/views/screens/taps/profile_tap.dart';
import 'package:iconly/iconly.dart';

class CustomProductItem extends StatefulWidget {
  Food food;
  CustomProductItem({required this.food});
  @override
  State<StatefulWidget> createState() => _CustomProductItemState();
}

class _CustomProductItemState extends State<CustomProductItem> {
  late Food food;
  bool favourite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    food = widget.food;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => ProfileTap(food: food,))
                  );
                },
                child: Image.asset(
                  food.imgChef,
                  fit: BoxFit.cover,
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  food.nameChef,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: mainText,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),

          Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => ProductItemScreen(food: food,)
                    )
                  );
                },
                child: Image.asset(
                  food.imgFood,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 16,
                right: 16,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8)
                  ),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            favourite = !favourite;
                          });
                        }, 
                        icon: Icon(
                          IconlyLight.heart,
                          color: favourite == false ? Colors.white : Colors.red,
                          size: 30,
                        )
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
          const SizedBox(height: 16),

          Text(
            food.name,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: const Color(0xFF3E5481)
            ),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                food.type,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: secondaryText
                ),
              ),
              Text(
                '  .> ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: secondaryText
                ),
              ),
              Text(
                '${food.duration.inMinutes} mins',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: secondaryText
                ),
              )
            ],
          ),

        ],
      )
    );
  }
}