import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/screens/verification_code.dart';
import 'package:food_app_yt/views/widgets/custom_button.dart';
import 'package:food_app_yt/views/widgets/custom_text_form_field.dart';
import 'package:iconly/iconly.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = true;
  // Dùng để valdate với form
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  // Biến để validate email và password
  bool _containsNumber = false;
  bool _atleast = false;

  @override
  Widget build(BuildContext context) {
    passwordTerms({required bool containsNumber, required bool atleast}){
      return Column(
        children: [
          Row(
            children: [
              Text(
                'Your Password must contain:',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: const Color(0xFF3E5481)),
              )
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: atleast == true ? const Color(0xFFE3FFF1) : outline,
                child: Icon(
                  Icons.check,
                  size: 12,
                  color: atleast == true ? primary : secondaryText,
                ),
              ),

              Text(
                'Atleast 6 characters',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: atleast == true ? mainText : secondaryText),
              )
            ],
          ),
          const SizedBox(height: 16),


          Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: containsNumber == true ? const Color(0xFFE3FFF1) : outline,
                child: Icon(
                  Icons.check,
                  size: 12,
                  color: containsNumber == true ? primary : secondaryText,
                ),
              ),

              Text(
                'Contains a number',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: containsNumber == true ? mainText : secondaryText),
              )
            ],
          )
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text('')
                ),

                Expanded(
                  flex: 6,
                  child: Form(
                    key:  key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Welcome',
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
                          onChanged: (value){
                            setState(() {
                              _atleast = value.length < 6 ? false : true;

                              _containsNumber = RegExp(r'\d').hasMatch(value); // Kiểm tra số có trong chuỗi
                            });
                          },
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
                      ],
                    ),
                  )
                ),
                const SizedBox(height: 16),

                Expanded(
                  flex: 5,
                  child: passwordTerms(
                    containsNumber: _containsNumber, 
                    atleast: _atleast
                  )
                ),

                Expanded(
                    flex: 2,
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
                                text: 'Sign Up', 
                                onPressed: (){
                                  setState(() {
                                    if(key.currentState!.validate()){
                                      Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: (context) => VerificationCode()
                                      )
                                      );
                                    };
                                  });
                                }
                              ),
                            )
                          )
                        ],
                      ),
                    ],
                  )
                )
              ],
            ),
          )
        ),
      )
    );
  }
}