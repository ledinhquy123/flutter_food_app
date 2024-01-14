import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/datas/food_data.dart';
import 'package:food_app_yt/models/food.dart';
import 'package:food_app_yt/views/widgets/custom_binary_option.dart';
import 'package:food_app_yt/views/widgets/custom_button.dart';
import 'package:food_app_yt/views/widgets/custom_product_item.dart';
import 'package:iconly/iconly.dart';

class ProfileTap extends StatefulWidget {
  Food? food;

  ProfileTap({this.food});
  @override
  State<StatefulWidget> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  bool liked = false;
  Food? food1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.food != null) {
      food1 = widget.food;
    }else {
      food1 = Food(name: '', imgFood: '', nameChef: 'Choirul Syafril', imgChef: 'assets/images/Avatar3.png', favouriteNumber: 0, type: '', duration: const Duration(seconds: 0), description: '', ingredients: [], steps: []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {}, 
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              )
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )
          ),  
        )
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: Image.asset(food1!.imgChef),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 14,
                            child: IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                                size: 14,
                              )
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 32),

                  Text(
                    food1!.nameChef,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: const Color(0xFF3E5481)
                    ),
                  ),
                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '32',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: const Color(0xFF3E5481)
                            ),
                          ),
                          const SizedBox(height: 4.0),

                          Text(
                            'Recipes',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: mainText
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            '782',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: const Color(0xFF3E5481)
                            ),
                          ),
                          const SizedBox(height: 4.0),

                          Text(
                            'Following',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: mainText
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            '1.287',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: const Color(0xFF3E5481)
                            ),
                          ),
                          const SizedBox(height: 4.0),

                          Text(
                            'Followers',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: mainText
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 32),

                  Row(
                    children: [
                      Expanded(
                        child:SizedBox(
                          height: 54,
                          child: CustomButton(
                            color: liked == false ? primary : outline, 
                            text: liked == false ? 'Follow' : 'Followed', 
                            textColor: liked == false ? Colors.white : mainText,
                            onPressed: () {
                              setState(() {
                                liked = !liked;
                              });
                            }
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),

                ],
              ),
            ),
            const SizedBox(height: 8.0),

            Container(
              color: Colors.white,
              child: Column(
                children: [
                  CustomBinaryOption(
                    textLeft: 'Recipes', 
                    textRight: 'Liked',
                  ),
                  const SizedBox(height: 16),

                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: FOOD_DATA.map((e) => CustomProductItem(food: e)).toList(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing:  10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1.5
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}