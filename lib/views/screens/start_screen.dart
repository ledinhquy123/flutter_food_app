import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/screens/sign_in_screen.dart';
import 'package:food_app_yt/views/widgets/custom_button.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/images/Onboarding.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            )
          ),
          const SizedBox(height: 12),

          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  'Start Cooking',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Text(
                    'Let’s join our community to cook better food!',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: CustomButton(text: 'Get Started', color: primary, onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen())
                );
              })
            ),
          ),

          const SizedBox(height: 56)
        ],
      ),
    );
  }
}