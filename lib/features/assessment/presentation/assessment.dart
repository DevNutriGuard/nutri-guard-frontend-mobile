// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
// import 'package:nutri_guard_mobile/core/widgets/button_widget.dart';
// import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
// import 'package:nutri_guard_mobile/core/widgets/custom_assessment_widget.dart';
// import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
// import 'package:nutri_guard_mobile/res/assets.dart';

// import '../../../core/widgets/custom_button_widget.dart';
// import '../../../res/res.dart';

// class Assessment extends StatefulWidget {
//   const Assessment({super.key});

//   @override
//   State<Assessment> createState() => _AssessmentState();
// }

// class _AssessmentState extends State<Assessment> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       appBar: CustomAppBar(
//           onBackPressed: (){},
//           centerIconAsset: Assets.appLogo,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const CustomAssessmentWidget(
//                   number: "1",
//                   title: "Medical Background",
//                   subtitle: "Share your medical history for tailored guidance."),
//               SizedBox(height: getHeight() * 0.02,),
//               const CustomAssessmentWidget(
//                   number: "2",
//                   title: "Lifestyle and Daily Habits",
//                   subtitle: "Tell us your habits to create a fitting plan."),
//               SizedBox(height: getHeight() * 0.02,),
//               const CustomAssessmentWidget(
//                   number: "3",
//                   title: "Diet and Nutrition Preferences",
//                   subtitle: "Set preferences to unlock personalized meals."),
//               SizedBox(height: getHeight() * 0.02,),
//               const CustomAssessmentWidget(
//                   number: "4",
//                   title: "Fitness and Physical Activity",
//                   subtitle: "Track fitness for customized insights."),
//               SizedBox(height: getHeight() * 0.02,),
//               const CustomAssessmentWidget(
//                   number: "5",
//                   title: "Health and Biohacking Goals",
//                   subtitle: "Define goals to optimize your health."),
//               SizedBox(height: getHeight() * 0.02,),
//               const CustomAssessmentWidget(
//                   number: "6",
//                   title: "Comprehensive Health Testing",
//                   subtitle: "Use health tests to refine your plan."),
//               SizedBox(height: getHeight() * 0.02,),
//               const CustomAssessmentWidget(
//                   number: "7",
//                   title: "Preferences for Plan Customization",
//                   subtitle: "Customize your plan with expert help."),
//               SizedBox(height: getHeight() * 0.03,),
//               CustomWidgetButton(
//                   label: "Let's Begin",
//                   onPressed: (){
//                     Navigator.pushReplacementNamed(context, AppRoutes.medicalBackGround1);
//                   }
//               )


//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
