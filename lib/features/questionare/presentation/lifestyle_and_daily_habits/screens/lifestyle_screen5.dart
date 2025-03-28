// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_super_parameters
//
// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
// import 'package:nutri_guard_mobile/core/widgets/check_option_tile.dart';
// import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
//
// class LifestyleScreen5 extends StatefulWidget {
//   const LifestyleScreen5({Key? key}) : super(key: key);
//
//   @override
//   _LifestyleScreen5State createState() => _LifestyleScreen5State();
// }
//
// class _LifestyleScreen5State extends State<LifestyleScreen5> {
//   int currentStep = 3;
//   List<String> selectedDrugsValues = [];
//   bool isHighlighted = false;
//
//   void toggleSelection(String value) {
//     setState(() {
//       if (selectedDrugsValues.contains(value)) {
//         selectedDrugsValues.remove(value);
//       } else {
//         selectedDrugsValues.add(value);
//       }
//     });
//   }
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
//               'Do you consume any of the following regularly?',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             CheckOptionTile(
//               title: 'Alcohol',
//               isSelected: selectedDrugsValues.contains('alcohol'),
//               onChanged: (bool? value) {
//                 toggleSelection('alcohol');
//               },
//             ),
//             CheckOptionTile(
//               title: 'Caffeine',
//               isSelected: selectedDrugsValues.contains('caffeine'),
//               onChanged: (bool? value) {
//                 toggleSelection('caffeine');
//               },
//             ),
//             CheckOptionTile(
//               title: 'Nicotine',
//               isSelected: selectedDrugsValues.contains('nicotine'),
//               onChanged: (bool? value) {
//                 toggleSelection('nicotine');
//               },
//             ),
//             CheckOptionTile(
//               title: 'Recreational Drugs',
//               isSelected: selectedDrugsValues.contains('recreationalDrugs'),
//               onChanged: (bool? value) {
//                 toggleSelection('recreationalDrugs');
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
//                         AppRoutes.lifestyleScreen4,
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
//                       if (selectedDrugsValues.isNotEmpty) {
//                         setState(() {
//                           currentStep++;
//                         });
//                         Navigator.pushReplacementNamed(
//                           context,
//                           AppRoutes.lifestyleScreen6,
//                           arguments: currentStep + 1,
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Please select at least one option.'),
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
import 'package:nutri_guard_mobile/core/widgets/check_option_tile.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/radio_widget.dart';
import '../../../../../res/utils.dart';
import '../domain/lifestyle_provider.dart';

class LifestyleScreen5 extends StatefulWidget {
  const LifestyleScreen5({Key? key}) : super(key: key);

  @override
  _LifestyleScreen5State createState() => _LifestyleScreen5State();
}

class _LifestyleScreen5State extends State<LifestyleScreen5> {
  // void toggleSelection(String value) {
  //   setState(() {
  //     if (context.read<LifestyleAndHabitProvider>().selectedDrugsValues.contains(value)) {
  //       context.read<LifestyleAndHabitProvider>().selectedDrugsValues.remove(value);
  //     } else {
  //       context.read<LifestyleAndHabitProvider>().selectedDrugsValues.add(value);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final lifeStyleProvider = Provider.of<LifestyleAndHabitProvider>(context);
    lifeStyleProvider.initContext(context: context);
    lifeStyleProvider.currentStep = 3;
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
              'Do you consume any of the following regularly?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RadioOptionTile(
              title: 'Alcohol',
              isSelected: lifeStyleProvider.selectedDrugsValues == 'ALC',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedDrugsValues = value! ? 'ALC' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Caffeine',
              isSelected: lifeStyleProvider.selectedDrugsValues == 'CAF',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedDrugsValues = value! ? 'CAF' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Nicotine',
              isSelected: lifeStyleProvider.selectedDrugsValues == 'NIC',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedDrugsValues = value! ? 'NIC' : null;
                });
              },
            ),
            RadioOptionTile(
              title: 'Recreational Drugs',
              isSelected: lifeStyleProvider.selectedDrugsValues == 'DRG',
              onChanged: (bool? value) {
                setState(() {
                  lifeStyleProvider.selectedDrugsValues = value! ? 'DRG' : null;
                });
              },
            ),
            // CheckOptionTile(
            //   title: 'Alcohol',
            //   isSelected: lifeStyleProvider.selectedDrugsValues.contains('ALC'),
            //   onChanged: (bool? value) {
            //     toggleSelection('ALC');
            //   },
            // ),
            // CheckOptionTile(
            //   title: 'Caffeine',
            //   isSelected: lifeStyleProvider.selectedDrugsValues.contains('CAF'),
            //   onChanged: (bool? value) {
            //     toggleSelection('CAF');
            //   },
            // ),
            // CheckOptionTile(
            //   title: 'Nicotine',
            //   isSelected: lifeStyleProvider.selectedDrugsValues.contains('NIC'),
            //   onChanged: (bool? value) {
            //     toggleSelection('NIC');
            //   },
            // ),
            // CheckOptionTile(
            //   title: 'Recreational Drugs',
            //   isSelected: lifeStyleProvider.selectedDrugsValues.contains('DRG'),
            //   onChanged: (bool? value) {
            //     toggleSelection('DRG');
            //   },
            // ),
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
                        AppRoutes.lifestyleScreen4,
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
                      if (lifeStyleProvider.selectedDrugsValues != null ||
                          lifeStyleProvider.selectedDrugsValues != '') {
                        // final provider = Provider.of<LifestyleAndHabitProvider>(context, listen: false);
                        // final profileId = await PreferenceUtils.getProfileId();
                        //
                        // await provider.saveLifestyleData(
                        //   energyLevel: 'MOD', // Replace with actual user input from previous screens
                        //   waterIntake: '12L', // Replace with actual user input from previous screens
                        //   sleepQuality: 'GD', // Replace with actual user input
                        //   substanceConsumption: selectedDrugsValues.join(','), // Combine selected values
                        //   stressLevel: 'OFT', // Replace with actual user input
                        //   profileId: profileId ?? '', // Ensure profile ID is passed
                        // );
                        print(
                            "selectedDrugsValues--->${lifeStyleProvider.selectedDrugsValues}");

                        setState(() {
                          lifeStyleProvider.currentStep++;
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.lifestyleScreen6,
                          arguments: lifeStyleProvider.currentStep + 1,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select at least one option.'),
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
