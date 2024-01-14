import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/screens/taps/second_upload_screen.dart';
import 'package:food_app_yt/views/widgets/custom_button.dart';
import 'package:food_app_yt/views/widgets/custom_slider.dart';
import 'package:food_app_yt/views/widgets/custom_text_field_in_upload.dart';
import 'package:food_app_yt/views/widgets/custom_text_form_field.dart';

class UploadTap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UploadTapState();
}

class _UploadTapState extends State<UploadTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                        '1/2',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: secondaryText
                          ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addCoverPhoto(),
                      const SizedBox(height: 32),

                      Text(
                        'Food Name',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: mainText
                        ),
                      ),
                      const SizedBox(height: 16),

                      CustomTextFieldInUpload(
                        hint: 'Enter food name',
                        radius: 32,
                      ),
                      const SizedBox(height: 32),

                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: mainText
                        ),
                      ),
                      const SizedBox(height: 16),

                      CustomTextFieldInUpload(
                        hint: 'Tell a little about your food',
                        maxLine: 4,
                      ),
                      const SizedBox(height: 32),

                      CustomSlider(),
                      const SizedBox(height: 32),

                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 56,
                              child: CustomButton(
                                color: primary, 
                                text: 'Next', 
                                onPressed: () {
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context) => SecondUploadScreen()
                                    )
                                  );
                                }
                              ),
                            )
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        )
      )
    );  
  }

  addCoverPhoto() {
    return InkWell(
      onTap: () {},
      child: DottedBorder(
        dashPattern: const [15.0, 5.0], // độ dài đoạn chấm, khoảng cách của chúng
        borderType: BorderType.RRect, // Viền hình chữ nhật 
        strokeWidth: 2,
        radius: const Radius.circular(16),

        color: outline,
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 5,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.photo,
                  size: 65,
                  color: Colors.grey,
                ),

                Text(
                  'Add Cover Photo',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: mainText
                  ),
                ),

                Text(
                  '(up to 12 Mb)',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: secondaryText
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}