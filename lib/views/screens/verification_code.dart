import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/screens/password_recovery_screen.dart';
import 'package:food_app_yt/views/widgets/custom_button.dart';
import 'package:food_app_yt/views/widgets/custom_pin_code.dart';

class VerificationCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child:Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(''),
                  ),

                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Text(
                          'Check your email',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 16),

                        Text(
                          'We.ve sent the code to your email',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: secondaryText
                          ),
                        ),
                        const SizedBox(height: 32),

                        CustomPinCode(),
                        const SizedBox(height: 8),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'code expires in: ',
                              style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: mainText),
                            ),
                            Text(
                              '03:12',
                              style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: secondary),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 56,
                                child: CustomButton(
                                  color: primary, 
                                  text: 'Verify', 
                                  onPressed: (){
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(builder: (context) => PasswordRecoveryScreen())
                                    );
                                  }
                                ),
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 32),

                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 56,
                                child: CustomButton(
                                  color: outline, 
                                  text: 'Send again', 
                                  onPressed: (){

                                  }
                                ),
                              )
                            )
                          ],
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