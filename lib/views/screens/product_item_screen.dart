import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/datas/food_data.dart';
import 'package:food_app_yt/models/food.dart';
import 'package:food_app_yt/views/screens/taps/profile_tap.dart';
import 'package:iconly/iconly.dart';

class ProductItemScreen extends StatefulWidget {
  Food food;

  ProductItemScreen({required this.food});
  @override
  State<StatefulWidget> createState() => _ProductItemScreenState();
}

class _ProductItemScreenState extends State<ProductItemScreen> {
  bool liked = false;
  int likes = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    likes = widget.food.favouriteNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/Food Picture.png'
              ),
            ),

            buttonArrow(context),
            scroll(context)
          ],
        ),
      ),
    );
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(28)
            )
          ),
          clipBehavior: Clip.hardEdge, // Giữ nguyên hình dạng của nút
          child:  BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              )
            ),
          ),
        ),
      ),
    );
  }

  scroll(BuildContext context) { 
    return DraggableScrollableSheet(
      initialChildSize: .6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD0DBEA),
                          borderRadius: BorderRadius.all(
                            Radius.circular(24)
                          )
                        ),
                      ),
                    ],
                  )
                ),

                Text(
                  widget.food.name,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: const Color(0xFF3E5481)
                  ),
                ),
                const SizedBox(height: 16.0),

                Row(
                  children: [
                    Text(
                      widget.food.type,
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
                      '${widget.food.duration.inMinutes} mins',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: secondaryText
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16.0),

                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => ProfileTap(
                            food: widget.food,
                          ))
                        );
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          widget.food.imgChef
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),

                    Text(
                      widget.food.nameChef,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: const Color(0xFF3E5481)
                      ),
                    ),
                    const Spacer(),

                    InkWell(
                      onTap: () {
                        setState(() {
                          likes = liked ? likes - 1 : likes + 1;
                          liked = !liked;
                        });
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: primary,
                        child: Icon(
                          IconlyBold.heart,
                          color: !liked ? outline : secondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),

                    Text(
                      '$likes Likes',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: const Color(0xFF3E5481)
                      ),
                    ),
                  ],
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(
                    height: 4.0,
                    color: Colors.grey,
                  ),
                ),

                Text(
                  'Description',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: const Color(0xFF3E5481)
                  ),
                ),
                const SizedBox(height: 16.0),

                Text(
                  widget.food.description,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: secondaryText,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(
                    height: 4.0,
                    color: Colors.grey,
                  ),
                ),

                Text(
                  'Ingredients',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: const Color(0xFF3E5481)
                    ),
                  ),
                const SizedBox(height: 16.0),

                ListView.builder(
                  controller: scrollController,
                  itemCount: widget.food.ingredients.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ingredientItem(index)
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(
                    height: 4.0,
                    color: Colors.grey,
                  ),
                ),

                Text(
                  'Steps',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: const Color(0xFF3E5481)
                    ),
                  ),
                const SizedBox(height: 32.0),

                ListView.builder(
                  controller: scrollController,
                  itemCount: widget.food.steps.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => stepItem(index)
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  ingredientItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundColor:  Color(0xFFE3FFF8),
            child: Icon(
              Icons.check,
              size: 16,
              color: primary,
            ),
          ),
          const SizedBox(width: 8),

          Text(
            widget.food.ingredients[index],
            softWrap: true,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: mainText,
            ),
          ),
        ],
      ),
    );
  }

  stepItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: mainText,
            child: Text('${index + 1}'),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 287,
                  child: Text(
                  widget.food.steps[index],
                  maxLines: 4,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: mainText,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              
              Image.asset(
                'assets/images/Rectangle 219.png',
                width: 271,
                height: 155,
              )
            ],
          )
        ],
      ),
    );  
  }
}