import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
import 'package:nutri_guard_mobile/features/notifications/notification_widget/notification_widget.dart';
import 'package:nutri_guard_mobile/res/res.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        onBackPressed: (){
          Navigator.pop(context);
        },
        title: "Notifications",
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: sizes?.width,
                height: sizes?.height,
                decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    const NotificationWidget(
                        title: "Track Family Health Together",
                        subtitle: "Use the Family Health Dashboard to monitor and plan meals and activities for everyone.",
                        time: "4h ago"
                    ),
                    SizedBox(height: sizes?.smallPadding),
                    const NotificationWidget(
                        title: "Track Family Health Together",
                        subtitle: "Use the Family Health Dashboard to monitor and plan meals and activities for everyone.",
                        time: "4h ago"
                    ),
                    SizedBox(height: sizes?.smallPadding),
                    const NotificationWidget(
                        title: "Track Family Health Together",
                        subtitle: "Use the Family Health Dashboard to monitor and plan meals and activities for everyone.",
                        time: "4h ago"
                    ),
                    SizedBox(height: sizes?.smallPadding),
                    const NotificationWidget(
                        title: "Track Family Health Together",
                        subtitle: "Use the Family Health Dashboard to monitor and plan meals and activities for everyone.",
                        time: "4h ago"
                    ),
                    SizedBox(height: sizes?.smallPadding),
                    const NotificationWidget(
                        title: "Track Family Health Together",
                        subtitle: "Use the Family Health Dashboard to monitor and plan meals and activities for everyone.",
                        time: "4h ago"
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
