import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/widgets/custom_button.dart';

class CustomFollowNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomFollowNotificationState();
}

class _CustomFollowNotificationState extends State<CustomFollowNotification> {
  bool followed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            child: Image.asset('assets/images/Avatar.png'),
          ),
          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dean Winchester',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: const Color(0xFF3E5481)
                ),
              ),

              Text(
                'now following you ・ 1h',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: secondaryText
                ),
              ),
            ],
          ),
          // const SizedBox(width: 70),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: followed == true ? 52 : 64),
              child: CustomButton(
                color: followed == false ? primary : form, 
                text: followed == false ? 'Follow' : 'Followed', 
                textColor: followed == false ? Colors.white : mainText,
                onPressed: () {
                  setState(() {
                    followed = !followed;
                  });
                }
              ),
            )
          )
        ],
      ),
    );
  }
}