// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/profile/presentation/profile/widgets/need_more_help_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/profile/widgets/profile_card_widget.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/profile/presentation/profile/widgets/connect_device_modal.dart';
import 'package:nutri_guard_mobile/res/utils.dart';

import '../../../../res/common_widgets.dart';
import '../../../../res/strings.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  ProfilescreenState createState() => ProfilescreenState();
}

class ProfilescreenState extends State<Profilescreen> {
  final List<Map<String, dynamic>> _cardsData = [
    {
      "icon": Assets.scanHistory,
      "title": "Scan History",
      "route": AppRoutes.scanHistoryScreen,
    },
    {
      "icon": Assets.connectDevice,
      "title": "Connect Device",
      "route": "connect_device",
    },
    {
      "icon": Assets.checkHeartRate,
      "title": "Check Heart Rate",
      "route": AppRoutes.heartCheckScreen,
    },
    {
      "icon": Assets.setYourGoals,
      "title": "Set Your Goals",
      "route": AppRoutes.setGoalsScreen1,
    },
    {
      "icon": Assets.subscription,
      "title": "Subscription",
      "route": AppRoutes.subscriptionScreen1,
    },
    {
      "icon": Assets.securityAndPrivacyPolicy,
      "title": "Security & Privacy Policy",
      "route": AppRoutes.securityAndPrivacyPolicyScreen,
    },
    {
      "icon": Assets.logout,
      "title": "Logout",
      "route": "logout",
    },
  ];

  void _showConnectDeviceModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ConnectDeviceModal(spikeUserId: '',),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ProfileAvatar(
                          networkImageUrl: PreferenceUtils.getString(
                                  Strings.profilePicture) ??
                              "",
                          assetImagePath: Assets.privacyImage,
                          radius: 30.0,
                        ),
                        Positioned(
                          bottom: 0,
                          right: -4,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.editProfileScreen);
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          PreferenceUtils.getString(Strings.userName) ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          PreferenceUtils.getString(Strings.email) ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: _cardsData.map((card) {
                    return ProfileCardWidget(
                      icon: card["icon"],
                      title: card["title"],
                      onTap: () {
                        if (card["route"] == "connect_device") {
                          _showConnectDeviceModal(context);
                        } else if (card["route"] == "logout") {
                          // Clear user preferences
                          PreferenceUtils.clearPreferences();

                          // Navigate to login screen
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.signIn,
                            (route) => false, // Remove all routes in the stack
                          );
                        } else {
                          Navigator.pushNamed(context, card["route"]);
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 300),
              child: const NeedMoreHelpWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
