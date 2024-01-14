import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/screens/new_password_screen.dart';
import 'package:food_app_yt/views/widgets/custom_button.dart';
import 'package:food_app_yt/views/widgets/custom_pin_code.dart';
import 'package:food_app_yt/views/widgets/custom_text_form_field.dart';
import 'package:iconly/iconly.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(''),
                  ),

                  Expanded(
                    flex: 6,
                    child: Form(
                      key: key,
                      child: Column(
                        children: [
                          Text(
                            'Password recovery',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 16),

                          Text(
                            'Enter your email to recover your password',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: secondaryText
                            ),
                          ),
                          const SizedBox(height: 32),

                          CustomTextFormField(
                            hintText: 'Email or phone number',
                            prefixIcon: IconlyLight.message,
                            inputType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please enter your Email';
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 56,
                            child: CustomButton(
                              color: primary, 
                              text: 'Next', 
                              onPressed: (){
                                setState(() {
                                  key.currentState!.validate();
                                });

                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => NewPasswordScreen())
                                );
                              }
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}