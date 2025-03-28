// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters
//
// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
// import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
// import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
//
// class LifestyleScreen2 extends StatefulWidget {
//   const LifestyleScreen2({Key? key}) : super(key: key);
//
//   @override
//   _LifestyleScreen2State createState() => _LifestyleScreen2State();
// }
//
// class _LifestyleScreen2State extends State<LifestyleScreen2> {
//   int currentStep = 0;
//   List<String> selectedConditions = [];
//   bool isHighlighted = false;
//
//   String? selectedEnergyLevel;
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
//               'How would you describe your typical energy levels throughout the day?',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             RadioOptionTile(
//               title: 'Low',
//               isSelected: selectedEnergyLevel == 'Low',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedEnergyLevel = value! ? 'Low' : null;
//                 });
//               },
//             ),
//             RadioOptionTile(
//               title: 'Moderate',
//               isSelected: selectedEnergyLevel == 'Moderate',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedEnergyLevel = value! ? 'Moderate' : null;
//                 });
//               },
//             ),
//             RadioOptionTile(
//               title: 'High',
//               isSelected: selectedEnergyLevel == 'High',
//               onChanged: (bool? value) {
//                 setState(() {
//                   selectedEnergyLevel = value! ? 'High' : null;
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
//                         AppRoutes.lifestyleScreen1,
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
//                       if (selectedEnergyLevel != null) {
//                         setState(() {
//                           currentStep++;
//                         });
//                         Navigator.pushReplacementNamed(
//                           context,
//                           AppRoutes.lifestyleScreen3,
//                           arguments: currentStep + 1,
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Please select an energy level'),
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
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/radio_widget.dart';
import 'package:provider/provider.dart';
import '../domain/lifestyle_provider.dart';

class LifestyleScreen2 extends StatefulWidget {
  const LifestyleScreen2({Key? key}) : super(key: key);

  @override
  _LifestyleScreen2State createState() => _LifestyleScreen2State();
}

class _LifestyleScreen2State extends State<LifestyleScreen2> {
  @override
  Widget build(BuildContext context) {
    final lifeStyleProvider = Provider.of<LifestyleAndHabitProvider>(context);
    lifeStyleProvider.initContext(context: context);
    lifeStyleProvider.currentStep = 0;
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
              'How would you describe your typical energy levels throughout the day?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Low',
              isSelected: lifeStyleProvider.selectedEnergyLevel == 'LOW',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedEnergyLevel = value! ? 'LOW' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Moderate',
              isSelected: lifeStyleProvider.selectedEnergyLevel == 'MOD',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedEnergyLevel = value! ? 'MOD' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'High',
              isSelected: lifeStyleProvider.selectedEnergyLevel == 'HIGH',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedEnergyLevel =
                      value! ? 'HIGH' : null;
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
                        AppRoutes.lifestyleScreen1,
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
                      if (lifeStyleProvider.selectedEnergyLevel != null) {
                        print(
                            "selectedEnergyLevel-->${lifeStyleProvider.selectedEnergyLevel}");
                        // final provider = Provider.of<LifestyleAndHabitProvider>(context, listen: false);
                        // await provider.saveLifestyleData(
                        //   energyLevel: lifeStyleProvider.selectedEnergyLevel!,
                        //   waterIntake: '12L', // Replace with actual user input
                        //   sleepQuality: 'GD', // Replace with actual user input
                        //   substanceConsumption: 'CAF', // Replace with actual user input
                        //   stressLevel: 'OFT',
                        //   profileId: '',
                        // );

                        setState(() {
                          lifeStyleProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.lifestyleScreen3,
                          arguments: lifeStyleProvider.currentStep + 1,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select an energy level'),
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
