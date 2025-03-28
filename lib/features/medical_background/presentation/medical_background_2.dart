// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
// import 'package:nutri_guard_mobile/core/widgets/custom_medication_pop_up.dart';
// import '../../../core/routes/app_routes.dart';
// import '../../../core/widgets/linear_progress_indicator.dart';
// import '../../../res/assets.dart';
// import '../../../res/common_widgets.dart';
// import '../../../res/res.dart';
// import '../widgets/custom_floating_button_widget.dart';
// import '../widgets/medical_background_button_widget.dart';

// class MedicalBackground2 extends StatefulWidget {
//   final int completedSections; // Receive completed sections from the previous screen

//   const MedicalBackground2({super.key, required this.completedSections});

//   @override
//   State<MedicalBackground2> createState() => _MedicalBackground2State();
// }

// class _MedicalBackground2State extends State<MedicalBackground2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: CustomAppBar(
//         title: "Medical Background",
//         onBackPressed: () {},
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   LinearProgressIndicatorWidget(completedSections: widget.completedSections),
//                   SizedBox(height: getHeight() * 0.04),
//                   CustomText(
//                     text: "Are you currently taking any \n             medications?",
//                     fontSize: sizes?.fontSize24,
//                     alignment: Alignment.center,
//                   ),
//                   SizedBox(height: getHeight() * 0.02),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         MedicalBackgroundButtonWidget(
//                           text: "No",
//                           textColor: AppColors.darkGreyTextColor,
//                           backgroundColor: AppColors.greyShadeColor,
//                           borderColor: AppColors.greyShadeColor,
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                         MedicalBackgroundButtonWidget(
//                           text: "Yes",
//                           textColor: AppColors.primaryColor,
//                           backgroundColor: AppColors.whiteColor,
//                           borderColor: AppColors.primaryColor,
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: getHeight() * 0.15),
//                   Image.asset(Assets.medicationIcon, height: 56, width: 56),
//                   SizedBox(height: getHeight() * 0.02),
//                   CustomText(
//                     text: "Tap the + icon to enter your medications.",
//                     fontWeight: FontWeight.w400,
//                     fontSize: sizes?.fontSize16,
//                     color: AppColors.lightGreyTextColor,
//                     alignment: Alignment.center,
//                   ),
//                   SizedBox(height: getHeight() * 0.3),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         MedicalBackgroundButtonWidget(
//                           text: "Previous",
//                           textColor: AppColors.blackTextColor,
//                           backgroundColor: AppColors.whiteColor,
//                           borderColor: AppColors.borderColor,
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                         MedicalBackgroundButtonWidget(
//                           text: "Next",
//                           textColor: AppColors.whiteColor,
//                           backgroundColor: AppColors.primaryColor,
//                           borderColor: AppColors.borderColor,
//                           onPressed: () {
//                             Navigator.pushNamed(context, AppRoutes.medicalBackGround3, arguments: widget.completedSections + 1);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               right: 16.0,
//               top: getHeight() * 0.65,
//               child: CustomFloatingButtonWidget(
//                 onPressed: () {
//                   showDialog(context: context,
//                     builder: (context) => CustomMedicationPopUp()
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
