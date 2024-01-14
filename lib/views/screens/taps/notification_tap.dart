import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/widgets/custom_follow_notification.dart';
import 'package:food_app_yt/views/widgets/custom_liked_notification.dart';

class NotificationTap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationTapSate();
}

class _NotificationTapSate extends State<NotificationTap> {
  List newItems = ['follow', 'liked'];
  List todayItems = ['follow', 'liked', 'liked'];
  List oldestItems = ['follow', 'liked', 'follow', 'liked'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: mainText
                  ),
                ),
                const SizedBox(height: 8),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: newItems.length,
                  itemBuilder: (context, index) {
                    return newItems[index] == 'follow' 
                    ? CustomFollowNotification() 
                    : CustomLikedNotification();
                  }
                ),
                const SizedBox(height: 16),

                Text(
                  'Today',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: mainText
                  ),
                ),
                const SizedBox(height: 8),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: todayItems.length,
                  itemBuilder: (context, index) {
                    return todayItems[index] == 'follow' 
                    ? CustomFollowNotification() 
                    : CustomLikedNotification();
                  }
                ),
                const SizedBox(height: 16),

                Text(
                  'Oldest',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: mainText
                  ),
                ),
                const SizedBox(height: 8),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: oldestItems.length,
                  itemBuilder: (context, index) {
                    return oldestItems[index] == 'follow' 
                    ? CustomFollowNotification() 
                    : CustomLikedNotification();
                  }
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      )
    );
  }
}