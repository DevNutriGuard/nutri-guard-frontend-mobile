// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
// import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
// import 'package:nutri_guard_mobile/features/medical_background/widgets/medical_background_button_widget.dart';
// import 'package:nutri_guard_mobile/res/common_widgets.dart';
// import 'package:nutri_guard_mobile/res/res.dart';
// import '../../../core/widgets/linear_progress_indicator.dart';
// import '../widgets/text_field_container.dart';

// class MedicalBackground1 extends StatefulWidget {
//   const MedicalBackground1({super.key});

//   @override
//   State<MedicalBackground1> createState() => _MedicalBackground1State();
// }

// class _MedicalBackground1State extends State<MedicalBackground1> {
//   int completedSections = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: CustomAppBar(
//         onBackPressed: () {},
//         title: "Medical Background",
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             LinearProgressIndicatorWidget(completedSections: completedSections),
//             SizedBox(height: getHeight() * 0.04),
//             CustomText(
//               text: "Do you have any diagnosed \n         medical condition?",
//               fontSize: sizes?.fontSize24,
//               alignment: Alignment.center,
//             ),
//             SizedBox(height: getHeight() * 0.02),
//             const TextFieldContainer(),
//             SizedBox(height: getHeight() * 0.05),
//             SizedBox(
//               height: getHeight() * 0.4,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   MedicalBackgroundButtonWidget(
//                     text: "Previous",
//                     textColor: AppColors.blackTextColor,
//                     backgroundColor: AppColors.whiteColor,
//                     borderColor: AppColors.borderColor,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   MedicalBackgroundButtonWidget(
//                     text: "Next",
//                     textColor: AppColors.whiteColor,
//                     backgroundColor: AppColors.primaryColor,
//                     borderColor: AppColors.borderColor,
//                     onPressed: () {
//                       Navigator.pushNamed(context, AppRoutes.medicalBackGround2,
//                           arguments: completedSections + 1);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
