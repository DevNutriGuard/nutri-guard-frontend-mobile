// ignore_for_file: prefer_const_constructors, use_super_parameters, library_private_types_in_public_api

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';
import 'package:nutri_guard_mobile/core/widgets/progress_indicator.dart';
import 'package:nutri_guard_mobile/core/widgets/upload_field_widget.dart';
import '../../../../../network/api_url.dart';
import '../../../../../res/assets.dart';
import 'package:http/http.dart' as http;
import '../../../../../res/strings.dart';
import '../../../../../res/utils.dart';

class ComprehensiveHealthTestingScreen1 extends StatefulWidget {
  const ComprehensiveHealthTestingScreen1({Key? key}) : super(key: key);

  @override
  _ComprehensiveHealthTestingScreen1State createState() =>
      _ComprehensiveHealthTestingScreen1State();
}

class _ComprehensiveHealthTestingScreen1State
    extends State<ComprehensiveHealthTestingScreen1> {
  int currentStep = 0;
  final Map<String, String?> uploadedFiles = {};
  String? bloodCountDocument;

  void _handleFileSelection(String key, String? filePath) {
    setState(() {
      uploadedFiles[key] = filePath;
    });
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> _showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.file_present),
                title: Text('Pick a PDF'),
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );
                  if (result != null) {
                    File pdfFile = File(result.files.single.path!);
                    print('PDF selected: ${pdfFile.path}');
                    preUploadFile(pdfFile);
                  } else {
                    print('No file selected');
                  }
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
      },
    );
  }

  // Future<String?> preUploadFile(File file) async {
  //   try {
  //     debugPrint("File Path: ${file.path}");
  //     List<String> pathParts = file.path.split('/');
  //     String fileName = pathParts.last.replaceAll(' ', '_'); // Replacing spaces with underscores
  //     debugPrint("Processed File Name: $fileName");
  //
  //     UploadDocCommonResponse? uploadDocCommonResponse = await MyApi.callPostApi(
  //       url: uploadDocUrl,
  //       body: {
  //         "file": fileName,
  //         "contentType": "application/octet-stream" // General MIME type for files
  //       },
  //       modelName: Models.uploadDocCommonResponse,
  //     );
  //     debugPrint("API Call Completed for URL: $uploadDocUrl");
  //
  //     if (uploadDocCommonResponse != null) {
  //       String url = uploadDocCommonResponse.data?.url ?? "";
  //       debugPrint("File URL: $url");
  //       return url;
  //     } else {
  //       debugPrint("API Response is null");
  //       return null;
  //     }
  //   } catch (e) {
  //     debugPrint("Error during file upload: $e");
  //     return null;
  //   }
  // }
  Future<String?> preUploadFile(File file) async {
    try {
      debugPrint("File Path: ${file.path}");
      List<String> pathParts = file.path.split('/');
      String fileName = pathParts.last
          .replaceAll(' ', '_'); // Replacing spaces with underscores
      debugPrint("Processed File Name: $fileName");
      // Create the request
      var request = http.MultipartRequest('POST', Uri.parse(uploadDocUrl));
      request.headers['Authorization'] =
          '${PreferenceUtils.getString(Strings.accessToken)}';

      request.files.add(
        await http.MultipartFile.fromPath(
          'file', // Field name expected by the server
          file.path,
          filename: fileName,
          contentType: MediaType.parse("application/pdf"),
        ),
      );

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        debugPrint("Response body: $responseBody");
        return responseBody; // Assuming the response contains the uploaded file URL
      } else {
        // Print more detailed information about the response
        var responseBody = await response.stream.bytesToString();
        debugPrint("Upload failed with status: ${response.statusCode}");
        debugPrint("Response body: $responseBody");
        return null;
      }
    } catch (e) {
      debugPrint("Error during file upload: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Comprehensive Health Testing',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ProgressIndicatorWidget(
              currentStep: currentStep,
              totalSteps: 2,
              stepWidth: 150,
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: UploadFieldWidget(
                      keyId: "completeBloodCountCBC",
                      title: "Complete Blood Count (CBC)",
                      subtitle:
                          "Assesses overall health, including red and white blood cells and platelets.",
                      onFileSelected: (filePath) => _handleFileSelection(
                          "completeBloodCountCBC", filePath),
                      uploadedFilePath: uploadedFiles["completeBloodCountCBC"],
                      fileIcon: Image.asset(Assets.uploadFile),
                    ),
                  ),
                  SizedBox(height: 20),
                  UploadFieldWidget(
                    keyId: "comprehensiveMetabolicPanelCMP",
                    title: "Comprehensive Metabolic Panel (CMP)",
                    subtitle:
                        "Covers kidney and liver function, electrolytes, and glucose levels.",
                    onFileSelected: (filePath) => _handleFileSelection(
                        "comprehensiveMetabolicPanelCMP", filePath),
                    uploadedFilePath:
                        uploadedFiles["comprehensiveMetabolicPanelCMP"],
                    fileIcon: Image.asset(Assets.uploadFile),
                  ),
                  SizedBox(height: 20),
                  UploadFieldWidget(
                    keyId: "lipidPanel",
                    title: "Lipid Panel",
                    subtitle:
                        "Includes total cholesterol, HDL, LDL, and triglycerides.",
                    onFileSelected: (filePath) =>
                        _handleFileSelection("lipidPanel", filePath),
                    uploadedFilePath: uploadedFiles["lipidPanel"],
                    fileIcon: Image.asset(Assets.uploadFile),
                  ),
                  SizedBox(height: 20),
                  UploadFieldWidget(
                    keyId: "nutritionalPanel",
                    title: "Nutritional Panel",
                    subtitle:
                        "Combines key vitamins (like Vitamin D and B12), minerals, and CRP levels for inflammation.",
                    onFileSelected: (filePath) =>
                        _handleFileSelection("nutritionalPanel", filePath),
                    uploadedFilePath: uploadedFiles["nutritionalPanel"],
                    fileIcon: Image.asset(Assets.uploadFile),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
                      if (currentStep > 0) {
                        setState(() {
                          currentStep--;
                        });
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.healthAndBiohackingScreen5,
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
                    onPressed: () {
                      setState(() {
                        currentStep++;
                      });
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.comprehensiveHealthTestingScreen2,
                      );
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
