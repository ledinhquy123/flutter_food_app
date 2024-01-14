import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/screens/home_screen.dart';
import 'package:food_app_yt/views/screens/sign_up_screen.dart';
import 'package:food_app_yt/views/widgets/custom_button.dart';
import 'package:food_app_yt/views/widgets/custom_text_form_field.dart';
import 'package:iconly/iconly.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInState();
} 

class _SignInState extends State<SignInScreen> {
  bool obscureText = true;
  // Dùng để valdate với form
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: key,
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('')
                    ),

                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 8),

                          Text(
                            'Please enter your account here',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: secondaryText),
                          ),
                          const SizedBox(height: 32),

                          CustomTextFormField(
                            hintText: 'Email or phone number', prefixIcon: IconlyLight.message, inputType: TextInputType.emailAddress,
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter Email or phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),

                          CustomTextFormField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter Password';
                              }
                              return null;
                            },
                            hintText: 'Password',
                            prefixIcon: IconlyLight.lock, 
                            suffixIcon: obscureText == true ? IconlyLight.hide : IconlyLight.show, obscureText: obscureText ,onPressedSuffixIcon: (){
                            setState(() {
                              obscureText = !obscureText;
                            });
                          }),
                          const SizedBox(height: 8),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: (){},
                                child: Text(
                                  'Forgot password?',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              )
                            ],
                          )
                        ],
                      )
                    ),

                    Expanded(
                      flex: 6,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 56,
                                child: CustomButton(
                                  color: primary, 
                                  text: 'Login', 
                                  onPressed: (){
                                    setState(() {
                                      if(key.currentState!.validate()){
                                        Navigator.push(
                                          context, 

                                          MaterialPageRoute(builder: (context) => HomeScreen())
                                        );
                                      }
                                    });
                                  }
                                ),
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 16),

                        Text(
                          'Or continue with',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: secondaryText),
                        ),
                        const SizedBox(height: 32),

                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 56,
                                child: CustomButton(
                                  color: const Color(0xFFFF5842), 
                                  text: 'G Google', 
                                  onPressed: (){}
                                ),
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 8),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have any account?', 
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => SignUpScreen())
                                );
                              }, 
                              child: Text(
                                'Sign Up',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: primary),
                              )
                            )
                          ],
                        )
                      ],
                    )
                  )
                ],
              ),
              )

            ),
          )
        )
      )
    );
  }
}