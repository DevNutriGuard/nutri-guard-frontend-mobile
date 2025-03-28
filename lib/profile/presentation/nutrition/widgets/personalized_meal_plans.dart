// incomplete !! need to get extra information from the abu bakr

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import '../../../../../res/assets.dart';

class PersonalizedMealPlans extends StatefulWidget {
  const PersonalizedMealPlans({super.key});

  @override
  _PersonalizedMealPlansState createState() => _PersonalizedMealPlansState();
}

class _PersonalizedMealPlansState extends State<PersonalizedMealPlans> {
  List<bool> isExpandedList = [false, false, false, false, false];
  List<bool> showImagesList = [false, false, false, false, false];

  List<List<Map<String, dynamic>>> foodOptions = [
    [
      {
        'image': Assets.profileImage,
        'title': 'Food 1',
        'navigateTo': '/screen1'
      },
      {
        'image': Assets.profileImage,
        'title': 'Food 2',
        'navigateTo': '/screen2'
      },
      {
        'image': Assets.profileImage,
        'title': 'Food 3',
        'navigateTo': '/screen3'
      },
    ],
    [
      {
        'image': Assets.profileImage,
        'title': 'Snack 1',
        'navigateTo': '/screen4'
      },
    ],
    [
      {
        'image': Assets.profileImage,
        'title': 'Lunch 1',
        'navigateTo': '/screen5'
      },
      {
        'image': Assets.profileImage,
        'title': 'Lunch 2',
        'navigateTo': '/screen6'
      },
    ],
    [
      {
        'image': Assets.profileImage,
        'title': 'Snack 2',
        'navigateTo': '/screen7'
      },
      {
        'image': Assets.profileImage,
        'title': 'Snack 3',
        'navigateTo': '/screen8'
      },
    ],
    [
      {
        'image': Assets.profileImage,
        'title': 'Dinner 1',
        'navigateTo': '/screen9'
      },
      {
        'image': Assets.profileImage,
        'title': 'Dinner 2',
        'navigateTo': '/screen10'
      },
      {
        'image': Assets.profileImage,
        'title': 'Dinner 3',
        'navigateTo': '/screen11'
      },
    ]
  ];

  List<int> kcalValues = [885, 200, 750, 180, 650];

  List<IconData> mealIcons = [
    Icons.breakfast_dining,
    Icons.fastfood,
    Icons.lunch_dining,
    Icons.fastfood,
    Icons.dinner_dining,
  ];

  void _toggleExpand(int index) {
    setState(() {
      isExpandedList[index] = !isExpandedList[index];
    });
  }

  void _toggleShowImages(int index) {
    setState(() {
      showImagesList[index] = !showImagesList[index];
    });
  }

  void _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 233, 233),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personalized Meal Plans",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < 5; i++) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            mealIcons[i],
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            i == 0
                                ? "Breakfast"
                                : i == 1
                                    ? "Snacks"
                                    : i == 2
                                        ? "Lunch"
                                        : i == 3
                                            ? "Snacks"
                                            : "Dinner",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => _toggleShowImages(i),
                        child: Icon(
                          Icons.expand_more_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recommended: ${kcalValues[i]} kcal",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (showImagesList[i]) ...[
                    const Text(
                      "Pick your plan:",
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        for (var food in foodOptions[i])
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      food['image']!,
                                      height: 40.0,
                                      width: 40.0,
                                    ),
                                    const SizedBox(width: 12.0),
                                    Text(
                                      food['title']!,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      _navigateTo(context, food['navigateTo']!),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}




// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import '../../../../../res/assets.dart';

// class PersonalizedMealPlans extends StatefulWidget {
//   const PersonalizedMealPlans({super.key});

//   @override
//   _PersonalizedMealPlansState createState() => _PersonalizedMealPlansState();
// }

// class _PersonalizedMealPlansState extends State<PersonalizedMealPlans> {
//   List<bool> showImagesList = List.generate(5, (index) => false);

//   List<List<Map<String, dynamic>>> foodOptions = [
//     [
//       {
//         'image': Assets.profileImage,
//         'title': 'Food 1',
//         'navigateTo': '/screen1'
//       },
//       {
//         'image': Assets.profileImage,
//         'title': 'Food 2',
//         'navigateTo': '/screen2'
//       },
//     ],
//     [
//       {
//         'image': Assets.profileImage,
//         'title': 'Snack 1',
//         'navigateTo': '/screen3'
//       },
//     ],
//     [
//       {
//         'image': Assets.profileImage,
//         'title': 'Lunch 1',
//         'navigateTo': '/screen4'
//       },
//     ],
//     [
//       {
//         'image': Assets.profileImage,
//         'title': 'Snack 2',
//         'navigateTo': '/screen5'
//       },
//     ],
//     [
//       {
//         'image': Assets.profileImage,
//         'title': 'Dinner 1',
//         'navigateTo': '/screen6'
//       },
//     ]
//   ];

//   List<int> kcalValues = [885, 200, 750, 180, 650];
//   List<String> mealTitles = [
//     "Breakfast",
//     "Snacks",
//     "Lunch",
//     "Snacks",
//     "Dinner"
//   ];
//   List<IconData> mealIcons = [
//     Icons.breakfast_dining,
//     Icons.fastfood,
//     Icons.lunch_dining,
//     Icons.fastfood,
//     Icons.dinner_dining,
//   ];

//   void _toggleShowImages(int index) {
//     setState(() {
//       showImagesList[index] = !showImagesList[index];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "Personalized Meal Plans",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Container(
//         color: Color(0xFFF5F5F5), // Light grey background
//         padding: const EdgeInsets.all(12.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: List.generate(5, (i) {
//               return Container(
//                 margin: const EdgeInsets.only(bottom: 12.0),
//                 padding: const EdgeInsets.all(12.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 4.0,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(mealIcons[i], color: AppColors.primaryColor),
//                             const SizedBox(width: 8),
//                             Text(
//                               mealTitles[i],
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         GestureDetector(
//                           onTap: () => _toggleShowImages(i),
//                           child: Icon(
//                             showImagesList[i]
//                                 ? Icons.expand_less_outlined
//                                 : Icons.expand_more_outlined,
//                             color: AppColors.primaryColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Recommended: ${kcalValues[i]} kcal",
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     if (showImagesList[i])
//                       Column(
//                         children: foodOptions[i]
//                             .map(
//                               (food) => Container(
//                                 margin:
//                                     const EdgeInsets.symmetric(vertical: 6.0),
//                                 padding: const EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                   color: Color(0xFFF5F5F5),
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Image.asset(
//                                           food['image']!,
//                                           height: 40.0,
//                                           width: 40.0,
//                                         ),
//                                         const SizedBox(width: 12.0),
//                                         Text(
//                                           food['title']!,
//                                           style: const TextStyle(
//                                             fontSize: 14.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Icon(
//                                       Icons.arrow_forward_ios,
//                                       color: AppColors.primaryColor,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                             .toList(),
//                       ),
//                   ],
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }
