import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/screens/home_screen.dart';
import 'package:food_app_yt/views/widgets/custom_button.dart';
import 'package:food_app_yt/views/widgets/custom_text_field_in_upload.dart';
import 'package:iconly/iconly.dart';

class SecondUploadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondUploadScreenState();
}

class _SecondUploadScreenState extends State<SecondUploadScreen> {
  List ingredients = [1];
  List listSteps = [1];
  int _indexStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context), 
                          child: Text(
                            'Cancel',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: secondary
                            ),
                          )
                        ),

                        Text(
                          '2/2',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: secondaryText
                            ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ingredients',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: mainText
                          ),
                        ),

                        TextButton.icon(
                          style: TextButton.styleFrom(
                            foregroundColor: mainText
                          ),
                          onPressed: () {
                            setState(() {
                              ingredients.add(ingredientItem(1));
                            });
                          }, 
                          icon: const Icon(Icons.add), 
                          label: const Text(
                            'Group',
                          )
                        )
                      ],
                    ),

                    ListView.builder(
                      shrinkWrap: true, // Tự động co về cho vừa kích thước

                      physics: NeverScrollableScrollPhysics(), // Không cho phép widget cuộn
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) => ingredientItem(index),
                    ),
                    const SizedBox(height: 16.0),

                    ingredientButton()
                  ],
                )
              ),
              const SizedBox(height: 8.0),

              Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Steps',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: mainText
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              _indexStep++;
                            });
                            setState(() {
                              listSteps.add(steps(_indexStep));
                            });
                          }, 
                          icon: const Icon(
                            Icons.add
                          )
                        )
                      ],
                    ),

                    ListView.builder(
                      itemCount: listSteps.length,
                      physics: NeverScrollableScrollPhysics(), // Không cho phép widget cuộn
                      shrinkWrap: true,
                      itemBuilder: (context, index) => steps(index)
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: SizedBox(
                            height: 56,
                            child: CustomButton(
                              color: form, 
                              text: 'Back', 
                              textColor: mainText,
                              onPressed: () {
                                Navigator.pop(context);
                              }
                            ),
                          )
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(''),
                        ),

                        Expanded(
                          flex: 12,
                          child: SizedBox(
                            height: 56,
                            child: CustomButton(
                              color: primary, 
                              text: 'Next', 
                              onPressed: () {
                                openDialog();
                              }
                            ),
                          )
                        ),
                      ],
                    )
                  ],
                ),
              )
              
            ],
          ),
        )
      )
    );  
  }

  ingredientItem(index) {
    return Dismissible(
      key: GlobalKey(),
      direction: ingredients.length > 1 ? DismissDirection.endToStart : DismissDirection.none, // Cho phép vuối theo chiều nào (nếu số phần tử > 1 thì vuốt từ cuối lên đầu, ngược lại không vuốt được)
      onDismissed: (derection) {
        setState(() {
          ingredients.removeAt(index);
        });
      },
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: CustomTextFieldInUpload(
          hint: 'Enter ingredient',
          icon: Icons.drag_indicator,
          radius: 32,
        ),
      )
    );
  }

  ingredientButton() {
    return InkWell(
      onTap: () {
        setState(() {
          ingredients.add(ingredientItem(1));
          // ingredients.insert(0, ingredientItem(1));
        });
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
          border: Border.all(
            width: 1,
            color: secondaryText
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
            ),
            Text(
              'Ingredient',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: mainText
              ),
            )
          ],
        )
      ),
    );
  }

  steps(int index) {
    return Dismissible(
      key: GlobalKey(), 
      direction: listSteps.length > 1 ? DismissDirection.endToStart : DismissDirection.none,
      onDismissed: (value) {
        setState(() {
          listSteps.removeAt(index);
        });
      },
      child: Stack(
        children: [
          Column(
            children: [
              CustomTextFieldInUpload(
                hint: 'Tell a little about your food',
                maxLine: 4,
                icon: Icons.drag_indicator, // trong textformfield thì icon mặc định sẽ ở đầu (khác với prefixIcon(nó nằm ở trong textfield) còn icon nằm ở ngoài)
              ),

              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  margin: const EdgeInsets.only(left: 40.0, top: 10.0, bottom: 32.0),
                  decoration: const BoxDecoration(
                    color: form,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8)
                    )
                  ),

                  child: const Icon(
                    IconlyBold.camera,
                    size: 30,
                  ),
                ),
              )
            ],
          ),

          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              backgroundColor: mainText, // Chỉnh size của avatar
              radius: 12,
              child: Text(
                '$index',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 12,
                color: Colors.white
                ), 
              ),
            ),
          )
        ],
      )
    );
  }

  Future openDialog() {
    return showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        ),
        content: Container(
          padding: const EdgeInsets.all(20),
          width: 324,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/image 8.png'),
              Text(
                'Upload Success',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Your recipe has been uploaded, you can see it on your profile',
                textAlign: TextAlign.center,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      color: primary, 
                      text: 'Back to Home', 
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => HomeScreen())
                        );
                      }
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}