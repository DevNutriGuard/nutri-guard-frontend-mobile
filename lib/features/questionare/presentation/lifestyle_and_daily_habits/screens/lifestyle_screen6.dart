// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters
//
// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
// import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
// import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
//
// class LifestyleScreen6 extends StatefulWidget {
//   const LifestyleScreen6({Key? key}) : super(key: key);
//
//   @override
//   _LifestyleScreen6State createState() => _LifestyleScreen6State();
// }
//
// class _LifestyleScreen6State extends State<LifestyleScreen6> {
//   int currentStep = 4;
//   List<String> selectedConditions = [];
//   bool isHighlighted = false;
//
//   String? selectedStressValues;
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
//               'How often do you experience stress?',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             RadioOptionTile(
//               title: 'Rarely',
//               isSelected: selectedStressValues == 'rarely',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedStressValues = value! ? 'rarely' : null;
//                 });
//               },
//             ),
//             RadioOptionTile(
//               title: 'Occasionally',
//               isSelected: selectedStressValues == 'occasionally',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedStressValues = value! ? 'occasionally' : null;
//                 });
//               },
//             ),
//             RadioOptionTile(
//               title: 'Often',
//               isSelected: selectedStressValues == 'often',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedStressValues = value! ? 'often' : null;
//                 });
//               },
//             ),
//             RadioOptionTile(
//               title: 'Constantly',
//               isSelected: selectedStressValues == 'constantly',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedStressValues = value! ? 'constantly' : null;
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
//                         AppRoutes.lifestyleScreen5,
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
//                       if (selectedStressValues != null) {
//                         setState(() {
//                           currentStep++;
//                         });
//                         Navigator.pushReplacementNamed(
//                           context,
//                           AppRoutes.lifestyleScreen7,
//                           arguments: currentStep + 1,
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Please select '),
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

class LifestyleScreen6 extends StatefulWidget {
  const LifestyleScreen6({Key? key}) : super(key: key);

  @override
  _LifestyleScreen6State createState() => _LifestyleScreen6State();
}

class _LifestyleScreen6State extends State<LifestyleScreen6> {
  @override
  Widget build(BuildContext context) {
    final lifeStyleProvider = Provider.of<LifestyleAndHabitProvider>(context);
    lifeStyleProvider.initContext(context: context);
    lifeStyleProvider.currentStep = 4;
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
              'How often do you experience stress?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Rarely',
              isSelected: lifeStyleProvider.selectedStressValues == 'RAR',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedStressValues =
                      value! ? 'RAR' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Occasionally',
              isSelected: lifeStyleProvider.selectedStressValues == 'OCC',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedStressValues =
                      value! ? 'OCC' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Often',
              isSelected: lifeStyleProvider.selectedStressValues == 'OFT',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedStressValues =
                      value! ? 'OFT' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Constantly',
              isSelected: lifeStyleProvider.selectedStressValues == 'CST',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedStressValues =
                      value! ? 'CST' : null;
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
                        AppRoutes.lifestyleScreen5,
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
                      if (lifeStyleProvider.selectedStressValues != null) {
                        // final provider = Provider.of<LifestyleAndHabitProvider>(context, listen: false);
                        // final profileId = await PreferenceUtils.getProfileId();
                        //
                        // await provider.saveLifestyleData(
                        //   energyLevel: 'MOD', // Replace with actual user input from previous screens
                        //   waterIntake: '12L', // Replace with actual user input from previous screens
                        //   sleepQuality: 'GD', // Replace with actual user input
                        //   substanceConsumption: 'CAF', // Replace with actual user input
                        //   stressLevel: lifeStyleProvider.selectedStressValues!, // Send selected stress level
                        //   profileId: profileId ?? '', // Ensure profile ID is passed
                        // );
                        print(
                            "lifeStyleProvider.selectedStressValues--->${lifeStyleProvider.selectedStressValues}");

                        setState(() {
                          lifeStyleProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.lifestyleScreen7,
                          arguments: lifeStyleProvider.currentStep + 1,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select a stress level.'),
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
