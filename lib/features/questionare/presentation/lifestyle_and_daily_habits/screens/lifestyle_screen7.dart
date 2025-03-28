// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
// import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
//
// class LifestyleScreen7 extends StatefulWidget {
//   const LifestyleScreen7({Key? key}) : super(key: key);
//
//   @override
//   _LifestyleScreen7State createState() => _LifestyleScreen7State();
// }
//
// class _LifestyleScreen7State extends State<LifestyleScreen7> {
//   int currentStep = 5;
//   List<String> selectedConditions = [];
//   bool isHighlightedForHealthConcern = false;
//   String? selectedHealthConcernOption;
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
//               'Fitness and Physical Activity',
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
//               'Do you have any specific health concerns or symptoms you would like to address?',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedHealthConcernOption = 'No';
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedHealthConcernOption == 'No'
//                           ? AppColors.primaryColor
//                           : Colors.grey[300],
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text(
//                       'No',
//                       style: TextStyle(
//                         color: selectedHealthConcernOption == 'No'
//                             ? Colors.white
//                             : Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedHealthConcernOption = 'Yes';
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedHealthConcernOption == 'Yes'
//                           ? AppColors.primaryColor
//                           : Colors.white,
//                       side: BorderSide(
//                         color: AppColors.primaryColor,
//                       ),
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text(
//                       'Yes',
//                       style: TextStyle(
//                         color: selectedHealthConcernOption == 'Yes'
//                             ? Colors.white
//                             : Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: () => _focusOnTextField(),
//               child: TextField(
//                 onChanged: _onTextChanged,
//                 maxLines: 4,
//                 decoration: InputDecoration(
//                   hintText: 'Enter any specific health concerns or symptoms.',
//                   hintStyle: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   contentPadding: EdgeInsets.all(10),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: isHighlightedForHealthConcern ? Colors.blue : Colors.grey,
//                     ),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
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
//                         AppRoutes.lifestyleScreen6,
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
//                       setState(() {
//                         currentStep++;
//                       });
//                       Navigator.pushReplacementNamed(
//                         context,
//                         AppRoutes.dietNurtion1,
//                       );
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
//
//   void _onTextChanged(String text) {
//     setState(() {
//       if (text.isNotEmpty && !selectedConditions.contains(text)) {
//         selectedConditions.add(text);
//       }
//       isHighlightedForHealthConcern = true;
//     });
//   }
//
//   void _focusOnTextField() {
//     setState(() {
//       isHighlightedForHealthConcern = true;
//     });
//
//     FocusScope.of(context).unfocus();
//   }
// }
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/features/questionare/widgets/yes_no_buttons_widget.dart';
import 'package:nutri_guard_mobile/res/toasts.dart';
import 'package:provider/provider.dart';
import '../../../../../res/utils.dart';
import '../domain/lifestyle_provider.dart';

class LifestyleScreen7 extends StatefulWidget {
  const LifestyleScreen7({Key? key}) : super(key: key);

  @override
  _LifestyleScreen7State createState() => _LifestyleScreen7State();
}

class _LifestyleScreen7State extends State<LifestyleScreen7> {
  @override
  Widget build(BuildContext context) {
    final lifeStyleProvider = Provider.of<LifestyleAndHabitProvider>(context);
    lifeStyleProvider.initContext(context: context);
    lifeStyleProvider.currentStep = 5;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Fitness and Physical Activity',
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
              'Do you have any specific health concerns or symptoms you would like to address?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            YesNoButtonsWidget(
              selectedOption:
                  lifeStyleProvider.selectedHealthConcernOption ?? '',
              onOptionSelected: (option) {
                setState(() {
                  lifeStyleProvider.selectedHealthConcernOption = option;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () => _focusOnTextField(),
                  child: TextField(
                    onChanged: _onTextChanged,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText:
                          'Enter any specific health concerns or symptoms.',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: lifeStyleProvider.isHighlightedForHealthConcern
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  bottom: 8,
                  child: Text(
                    "0 Selected",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
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
                        AppRoutes.lifestyleScreen6,
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
                      final provider = Provider.of<LifestyleAndHabitProvider>(
                          context,
                          listen: false);
                      final profileId = await PreferenceUtils.getProfileId();

                      await provider
                          .saveLifestyleData(
                        profileId:
                            profileId ?? "", // Send health concerns if 'Yes'
                      )
                          .then((value) {
                        if (value) {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.dietNurtion1,
                          );
                        } else {
                          Toasts.getErrorToast(text: "Something bad happened.");
                        }
                      });
                      print(
                          "selectedHealthConcernOption-->${lifeStyleProvider.selectedHealthConcernOption}");
                      print(
                          "selectedHealthConcernOption-->${lifeStyleProvider.healthConcerns}");

                      setState(() {
                        lifeStyleProvider.currentStep++;
                      });
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

  void _onTextChanged(String text) {
    setState(() {
      context.read<LifestyleAndHabitProvider>().healthConcerns =
          text; // Store the entered health concerns
      context.read<LifestyleAndHabitProvider>().isHighlightedForHealthConcern =
          true;
    });
  }

  void _focusOnTextField() {
    setState(() {
      context.read<LifestyleAndHabitProvider>().isHighlightedForHealthConcern =
          true;
    });

    FocusScope.of(context).unfocus();
  }
}
