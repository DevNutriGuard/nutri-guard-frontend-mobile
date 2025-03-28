import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/button_widget.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button.dart';
import 'package:nutri_guard_mobile/profile/presentation/heart-check/widgets/flash_light_switch.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import 'package:provider/provider.dart';

import '../../nutrition/widgets/scan_options_modal.dart';
import '../domain/scanner_provider.dart';

class ScannerScreen extends StatefulWidget {
  final ScanType? scanType;
  const ScannerScreen({super.key, this.scanType});

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with SingleTickerProviderStateMixin {
  bool isSwitchOn = false;
  late AnimationController _controller;
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      _cameraController = CameraController(cameras[0], ResolutionPreset.high);
      _initializeControllerFuture = _cameraController!.initialize();
      await _initializeControllerFuture;
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _toggleFlash() {
    if (_cameraController != null) {
      setState(() {
        isSwitchOn = !isSwitchOn;
        _cameraController!
            .setFlashMode(isSwitchOn ? FlashMode.torch : FlashMode.off);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double responsiveFontSize = screenWidth * 0.05;

    final double progressPercentage = (_controller.value * 100).clamp(0, 100);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Scanner',
          style: TextStyle(fontSize: responsiveFontSize),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlashLightSwitch(
              text: 'Turn on flash light',
              isRedBox: false,
              isSwitchOn: isSwitchOn,
              onToggle: (value) {
                _toggleFlash();
              },
            ),
            const SizedBox(height: 30),
            // Camera Preview
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 343,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CameraPreview(_cameraController!),
                        ),
                      ),
                      // Scanning Overlay with Custom Border
                      Container(
                        width: screenWidth * 0.8,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        child: SizedBox(
                          width: screenWidth * 0.8,
                          child: Text(
                            "Detecting meal. Adjust at the camera and remain still...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: responsiveFontSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: getHeight() * 0.07,
              width: getWidth() * 0.2,
              child: CustomButton(
                label: 'Capture',
                onPressed: () async {
                  final XFile picture = await _cameraController!.takePicture();
                  final scannerProvider =
                  Provider.of<ScannerProvider>(context, listen: false);
                  await scannerProvider.scanGenericApi(
                      imagePath: picture.path,
                      scanType: widget.scanType!,
                      context: context);
                },
                backgroundColor: AppColors.primaryColor,

              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Complete',
                              style: TextStyle(
                                fontSize: responsiveFontSize,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${progressPercentage.toStringAsFixed(0)}%',
                              style: TextStyle(
                                fontSize: responsiveFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: _controller.value,
                            backgroundColor: Colors.grey[300],
                            color: Colors.red,
                            minHeight: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
