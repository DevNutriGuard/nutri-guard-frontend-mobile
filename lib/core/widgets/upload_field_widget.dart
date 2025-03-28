// // ignore_for_file: use_super_parameters, prefer_const_constructors, use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

// class UploadFieldWidget extends StatelessWidget {
//   final String keyId;
//   final String title;
//   final String subtitle;
//   final Function(String?) onFileSelected;
//   final String? uploadedFilePath;
//   final Widget? fileIcon;

//   const UploadFieldWidget({
//     Key? key,
//     required this.keyId,
//     required this.title,
//     required this.subtitle,
//     required this.onFileSelected,
//     this.uploadedFilePath,
//     this.fileIcon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.black,
//           ),
//         ),
//         SizedBox(height: 2),
//         Text(
//           subtitle,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.black54,
//           ),
//         ),
//         SizedBox(height: 10),
//         // GestureDetector(
//         //   onTap: () async {
//         //     FilePickerResult? result = await FilePicker.platform.pickFiles();
//         //     if (result != null && result.files.isNotEmpty) {
//         //       final filePath = result.files.single.path;
//         //       onFileSelected(filePath);
//         //       ScaffoldMessenger.of(context).showSnackBar(
//         //         SnackBar(
//         //           content: Text(
//         //             "File uploaded: ${result.files.single.name}",
//         //             style: TextStyle(color: Colors.white),
//         //           ),
//         //           backgroundColor: Colors.green,
//         //         ),
//         //       );
//         //     } else {
//         //       ScaffoldMessenger.of(context).showSnackBar(
//         //         SnackBar(
//         //           content: Text(
//         //             "No file selected.",
//         //             style: TextStyle(color: Colors.white),
//         //           ),
//         //           backgroundColor: Colors.red,
//         //         ),
//         //       );
//         //     }
//         //   },
//         //   child: Container(
//         //     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//         //     decoration: BoxDecoration(
//         //       border: Border.all(color: AppColors.primaryColor, width: 1),
//         //       borderRadius: BorderRadius.circular(8),
//         //       color: Colors.grey.shade200,
//         //     ),
//         //     child: Row(
//         //       children: [
//         //         fileIcon ??
//         //             Icon(
//         //               Icons.file_present,
//         //               color: AppColors.primaryColor,
//         //             ),
//         //         SizedBox(width: 10),
//         //         Expanded(
//         //           child: RichText(
//         //             text: TextSpan(
//         //               children: [
//         //                 TextSpan(
//         //                   text: "Click here ",
//         //                   style: TextStyle(
//         //                     color: Colors.blue,
//         //                     fontSize: 16,
//         //                     fontWeight: FontWeight.w500,
//         //                   ),
//         //                 ),
//         //                 TextSpan(
//         //                   text: uploadedFilePath != null
//         //                       ? uploadedFilePath!.split('/').last
//         //                       : "to upload your file",
//         //                   style: TextStyle(
//         //                     color: Colors.black,
//         //                     fontSize: 16,
//         //                     fontWeight: FontWeight.w400,
//         //                   ),
//         //                 ),
//         //               ],
//         //             ),
//         //           ),
//         //         ),
//         //       ],
//         //     ),
//         //   ),
//         // ),
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.primaryColor, width: 1),
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.grey.shade200,
//           ),
//           child: Row(
//             children: [
//               fileIcon ??
//                   Icon(
//                     Icons.file_present,
//                     color: AppColors.primaryColor,
//                   ),
//               SizedBox(width: 10),
//               Expanded(
//                 child: RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "Click here ",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       TextSpan(
//                         text: uploadedFilePath != null
//                             ? uploadedFilePath!.split('/').last
//                             : "to upload your file",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// ignore_for_file: use_super_parameters, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nutri_guard_mobile/res/assets.dart';

class UploadFieldWidget extends StatelessWidget {
  final String keyId;
  final String title;
  final String subtitle;
  final Function(String?) onFileSelected;
  final String? uploadedFilePath;
  final Widget? fileIcon;

  const UploadFieldWidget({
    Key? key,
    required this.keyId,
    required this.title,
    required this.subtitle,
    required this.onFileSelected,
    this.uploadedFilePath,
    this.fileIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              onFileSelected(result.files.single.path);
            }
          },
          child: uploadedFilePath == null
              ? _dashedBorderContainer()
              : _normalContainer(),
        ),
      ],
    );
  }

  Widget _dashedBorderContainer() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(8),
      color: const Color.fromARGB(255, 147, 181, 214),
      strokeWidth: 1.2,
      dashPattern: [5, 3],
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 229, 243, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _smallIconContainer(),
            SizedBox(width: 8),
            Text(
              "Click here ",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "to upload your file",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _normalContainer() {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 229, 243, 255),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _smallIconContainer(),
          SizedBox(width: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Click here ",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: uploadedFilePath!.split('/').last,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallIconContainer() {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        Assets.fileSymlink,
        width: 20,
        height: 20,
        fit: BoxFit.contain,
      ),
    );
  }
}
