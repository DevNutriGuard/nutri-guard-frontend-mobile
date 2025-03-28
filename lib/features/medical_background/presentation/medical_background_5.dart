// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
// import '../../../core/routes/app_routes.dart';
// import '../../../core/widgets/linear_progress_indicator.dart';
// import '../../../res/assets.dart';
// import '../../../res/common_widgets.dart';
// import '../../../res/res.dart';
// import '../widgets/custom_floating_button_widget.dart';
// import '../widgets/medical_background_button_widget.dart';
// import '../widgets/text_field_container.dart';

// class MedicalBackground5 extends StatefulWidget {
//   final int completedSections; // Receive completed sections from the previous screen

//   const MedicalBackground5({super.key, required this.completedSections});

//   @override
//   State<MedicalBackground5> createState() => _MedicalBackground5State();
// }

// class _MedicalBackground5State extends State<MedicalBackground5> {
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
//             Column(
//               children: [
//                 LinearProgressIndicatorWidget(completedSections: widget.completedSections),
//                 SizedBox(height: getHeight() * 0.04),
//                 CustomText(
//                   text: "        Do you have any past medical    \n          conditions that might affect \n                   your health plan?",
//                   fontSize: sizes?.fontSize24,
//                   alignment: Alignment.center,
//                   lines: 3,
//                 ),
//                 SizedBox(height: getHeight() * 0.02),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MedicalBackgroundButtonWidget(
//                         text: "No",
//                         textColor: AppColors.darkGreyTextColor,
//                         backgroundColor: AppColors.greyShadeColor,
//                         borderColor: AppColors.greyShadeColor,
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       MedicalBackgroundButtonWidget(
//                         text: "Yes",
//                         textColor: AppColors.primaryColor,
//                         backgroundColor: AppColors.whiteColor,
//                         borderColor: AppColors.primaryColor,
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: getHeight() * 0.04),
//                 const TextFieldContainer(),
//                 SizedBox(height: getHeight() * 0.3),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MedicalBackgroundButtonWidget(
//                         text: "Previous",
//                         textColor: AppColors.blackTextColor,
//                         backgroundColor: AppColors.whiteColor,
//                         borderColor: AppColors.borderColor,
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       MedicalBackgroundButtonWidget(
//                         text: "Next",
//                         textColor: AppColors.whiteColor,
//                         backgroundColor: AppColors.primaryColor,
//                         borderColor: AppColors.borderColor,
//                         onPressed: () {
//                           Navigator.pushNamed(context, AppRoutes.medicalBackGround6, arguments: widget.completedSections + 1);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }
