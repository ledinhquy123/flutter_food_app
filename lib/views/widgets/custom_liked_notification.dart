import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';

class CustomLikedNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomLikedNotificationState();
}

class _CustomLikedNotificationState extends State<CustomLikedNotification> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            children: [
              Positioned(
                top: 8,
                left: 8,
                child: CircleAvatar(
                  radius: 25,
                  child: Image.asset('assets/images/Avatar1.png'),
                ),
              ),

              Positioned(
                top: 24,
                left: 0,
                child: CircleAvatar(
                  radius: 25,
                  child: Image.asset('assets/images/Avatar2.png'),
                ),
              )
            ],
          ),
        ),

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: RichText(
                  maxLines: 3,
                  text: TextSpan(
                    text: 'John Steve',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: const Color(0xFF3E5481
                      )
                    ),
                    children: [
                      TextSpan(
                        text: ' and\n',
                        style: Theme.of(context).textTheme.       bodyMedium!.copyWith(
                          color: secondaryText
                        ),
                      ),
                      TextSpan(
                        text: 'Sam Winchester\n',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: const Color(0xFF3E5481)
                        ),
                      ),

                      TextSpan(
                        text: 'liked your recipe ・ 20 min',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: secondaryText
                        ),
                      ),
                    ]
                  )
                ),
              )
            ],
          ),
        ),

        SizedBox(
          height: 64,
          width: 64,
          child: Image.asset(
            'assets/images/Cover.png',
          ),
        )
      ],
    );
  }
}