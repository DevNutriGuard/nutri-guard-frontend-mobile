import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/res.dart';

class NutritionScannerScreen extends StatefulWidget {
  @override
  _NutritionScannerScreenState createState() => _NutritionScannerScreenState();
}

class _NutritionScannerScreenState extends State<NutritionScannerScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _flashOn = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      _controller = CameraController(cameras[0], ResolutionPreset.high);
      _initializeControllerFuture = _controller!.initialize();
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
    _controller?.dispose();
    super.dispose();
  }

  void _toggleFlash() {
    setState(() {
      _flashOn = !_flashOn;
      _controller?.setFlashMode(_flashOn ? FlashMode.torch : FlashMode.off);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller!),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: sizes?.width,
                        height: sizes?.height,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor
                        ),
                      ),
                      SwitchListTile(
                        title: Text(
                          "Turn On Flash Light",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: _flashOn,
                        onChanged: (value) => _toggleFlash(),
                        activeColor: Colors.green,
                      ),
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Detecting meal. Adjust at the camera and remain still...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      LinearProgressIndicator(
                        value: 0.5, // Example progress value
                        backgroundColor: Colors.white54,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Complete: 50%",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),

                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
