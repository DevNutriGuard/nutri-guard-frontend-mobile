// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
// import 'package:nutri_guard_mobile/res/assets.dart';
//
// class ConnectDeviceModal extends StatelessWidget {
//   const ConnectDeviceModal({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> deviceImages = [
//       Assets.watch,
//       Assets.garmin,
//       Assets.fitbit,
//       Assets.polar,
//     ];
//
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       backgroundColor: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               "Connect Device",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             const Text(
//               "Sync your device with record to effortlessly track your workouts, monitor your heart rate, and stay on top of your fitness goals.",
//               style: TextStyle(fontSize: 14, color: Colors.black54),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16.0),
//             Column(
//               children: List.generate(deviceImages.length, (index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       height: 40,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12.0),
//                         border:
//                             Border.all(color: AppColors.primaryColor, width: 1),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Image.asset(
//                           deviceImages[index],
//                           width: 70,
//                           height: 70,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//             const SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     fixedSize: const Size(120, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                   ),
//                   child: const Text(
//                     "Cancel",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primaryColor,
//                     fixedSize: const Size(120, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                   ),
//                   child: const Text(
//                     "Set",
//                     style: TextStyle(color: Colors.white, fontSize: 16),
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
import 'package:nutri_guard_mobile/features/spike/device_connection_service.dart';
import 'package:nutri_guard_mobile/res/assets.dart';

class ConnectDeviceModal extends StatelessWidget {
  final String spikeUserId;

  const ConnectDeviceModal({super.key, required this.spikeUserId});

  @override
  Widget build(BuildContext context) {
    final List<String> deviceImages = [
      Assets.watch,
      Assets.garmin,
      Assets.fitbit,
      Assets.polar,
    ];

    // Add a list of corresponding device names
    final List<String> deviceNames = [
      "apple watch",
      "garmin",
      "fitbit",
      "polar",
    ];

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Connect Device",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Sync your device with record to effortlessly track your workouts, monitor your heart rate, and stay on top of your fitness goals.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Column(
              children: List.generate(deviceImages.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    onTap: () async {
                      await _connectDevice(context, deviceNames[index]);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border:
                        Border.all(color: AppColors.greyShadeColor, width: 1),

                      ),
                      child: Center(
                        child: Image.asset(
                          deviceImages[index],
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    "Set",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _connectDevice(BuildContext context, String deviceName) async {
    await DeviceConnectionService().connectDeviceToSpike(deviceName, spikeUserId);
    Navigator.pop(context);
  }
}
