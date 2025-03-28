// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters
//
// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
// import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
// import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
//
// class LifestyleScreen4 extends StatefulWidget {
//   const LifestyleScreen4({Key? key}) : super(key: key);
//
//   @override
//   _LifestyleScreen4State createState() => _LifestyleScreen4State();
// }
//
// class _LifestyleScreen4State extends State<LifestyleScreen4> {
//   int currentStep = 2;
//   List<String> selectedConditions = [];
//   bool isHighlighted = false;
//
//   String? selectedSleepQuality;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 30),
//             Text(
//               'Lifestyle and Daily Habits',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 50),
//             ProgressIndicatorWidget(currentStep: currentStep, totalSteps: 6),
//             SizedBox(height: 50),
//             Text(
//               'How would you rate the quality of your sleep?',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             RadioOptionTile(
//               title: 'Poor',
//               isSelected: selectedSleepQuality == 'poor',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedSleepQuality = value! ? 'poor' : null;
//                 });
//               },
//             ),
//             RadioOptionTile(
//               title: 'Fair',
//               isSelected: selectedSleepQuality == 'fair',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedSleepQuality = value! ? 'fair' : null;
//                 });
//               },
//             ),
//             RadioOptionTile(
//               title: 'Good',
//               isSelected: selectedSleepQuality == 'good',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedSleepQuality = value! ? 'good' : null;
//                 });
//               },
//             ),
//             RadioOptionTile(
//               title: 'Excellent',
//               isSelected: selectedSleepQuality == 'excellent',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedSleepQuality = value! ? 'excellent' : null;
//                 });
//               },
//             ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       side: BorderSide(color: AppColors.primaryColor),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 14, horizontal: 40),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () {
//                       if (currentStep > 0) {
//                         setState(() {
//                           currentStep--;
//                         });
//                       }
//                       Navigator.pushReplacementNamed(
//                         context,
//                         AppRoutes.lifestyleScreen3,
//                       );
//                     },
//                     child: Text(
//                       'Previous',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryColor,
//                       padding:
//                           EdgeInsets.symmetric(vertical: 14, horizontal: 40),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () {
//                       if (selectedSleepQuality != null) {
//                         setState(() {
//                           currentStep++;
//                         });
//                         Navigator.pushReplacementNamed(
//                           context,
//                           AppRoutes.lifestyleScreen5,
//                           arguments: currentStep + 1,
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Please select quality of sleep'),
//                           ),
//                         );
//                       }
//                     },
//                     child: Text(
//                       'Next',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
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
// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../res/utils.dart';
import '../domain/lifestyle_provider.dart';

class LifestyleScreen4 extends StatefulWidget {
  const LifestyleScreen4({Key? key}) : super(key: key);

  @override
  _LifestyleScreen4State createState() => _LifestyleScreen4State();
}

class _LifestyleScreen4State extends State<LifestyleScreen4> {
  @override
  Widget build(BuildContext context) {
    final lifeStyleProvider = Provider.of<LifestyleAndHabitProvider>(context);
    lifeStyleProvider.initContext(context: context);
    lifeStyleProvider.currentStep = 2;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Lifestyle and Daily Habits',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ProgressIndicatorWidget(
                currentStep: lifeStyleProvider.currentStep, totalSteps: 6),
            SizedBox(height: 50),
            Text(
              'How would you rate the quality of your sleep?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Poor',
              isSelected: lifeStyleProvider.selectedSleepQuality == 'PR',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedSleepQuality = value! ? 'PR' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Fair',
              isSelected: lifeStyleProvider.selectedSleepQuality == 'FR',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedSleepQuality = value! ? 'FR' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Good',
              isSelected: lifeStyleProvider.selectedSleepQuality == 'GD',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedSleepQuality = value! ? 'GD' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Excellent',
              isSelected: lifeStyleProvider.selectedSleepQuality == 'EX',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedSleepQuality = value! ? 'EX' : null;
                });
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColors.primaryColor),
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (lifeStyleProvider.currentStep > 0) {
                        setState(() {
                          lifeStyleProvider.currentStep--;
                        });
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.lifestyleScreen3,
                      );
                    },
                    child: Text(
                      'Previous',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      if (lifeStyleProvider.selectedSleepQuality != null) {
                        // final provider = Provider.of<LifestyleAndHabitProvider>(context, listen: false);
                        // final profileId = await PreferenceUtils.getProfileId();
                        //
                        // await provider.saveLifestyleData(
                        //   energyLevel: 'MOD', // Replace with actual user input from previous screens
                        //   waterIntake: '12L', // Replace with actual user input from previous screens
                        //   sleepQuality: selectedSleepQuality!,
                        //   substanceConsumption: 'CAF', // Replace with actual user input
                        //   stressLevel: 'OFT', // Replace with actual user input
                        //   profileId: profileId ?? '', // Ensure profile ID is passed
                        // );
                        print(
                            "lifeStyleProvider-->${lifeStyleProvider.selectedSleepQuality}");

                        setState(() {
                          lifeStyleProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.lifestyleScreen5,
                          arguments: lifeStyleProvider.currentStep + 1,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select quality of sleep'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
