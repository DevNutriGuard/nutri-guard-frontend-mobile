// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
import 'package:nutri_guard_mobile/profile/presentation/set-goals/widgets/achived_goals_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/set-goals/widgets/set_goals_cards_widget.dart';

import '../../../../res/assets.dart';

class SetGoalsScreen1 extends StatefulWidget {
  const SetGoalsScreen1({super.key});

  @override
  SetGoalsScreen1State createState() => SetGoalsScreen1State();
}

class SetGoalsScreen1State extends State<SetGoalsScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          onBackPressed: (){
            Navigator.pop(context);
          },
        title: "My Goals",
        trailingIconAsset: Assets.circlePlus,
          backButtonColor: AppColors.greyColor,
        backgroundColor: AppColors.whiteColor,
        onTrailingIconPressed: (){
          Navigator.pushNamed(context, AppRoutes.setGoalsScreen2);
        }
        // centerIconAsset: Assets.add,
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 16.0),
      //     child: GestureDetector(
      //       onTap: () {
      //         Navigator.pop(context);
      //       },
      //       child: Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.black,
      //       ),
      //     ),
      //   ),
      //   title: const Text(
      //     'My Goals',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 16.0),
      //       child: GestureDetector(
      //         onTap: () {
      //           Navigator.pushNamed(context, AppRoutes.setGoalsScreen2);
      //         },
      //         child: Icon(
      //           Icons.add,
      //           color: Colors.black,
      //           size: 28,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            AchivedGoalsWidget(),
            SizedBox(
              height: 10,
            ),
            SetGoalsCardsWidget(),
          ],
        ),
      ),
    );
  }
}
