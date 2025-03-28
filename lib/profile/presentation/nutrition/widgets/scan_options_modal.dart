import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/scanner/presentation/scanner_screen.dart';
import 'package:nutri_guard_mobile/res/assets.dart';

enum ScanType {
  meal, // For "Meals Scanning"
  foodProduct, // For "Food Product Scanning"
  medicine, // For "Medication Scanning"
  supplement // For "Supplement Scanning"
}

class ScanOptionsModal extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const ScanOptionsModal({
    Key? key,
    required this.onCancel,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Image.asset(
                  Assets.mealsScanning,
                  width: 35,
                  height: 35,
                ),
                title: Text(
                  "Meals Scanning",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScannerScreen(scanType: ScanType.meal)),
                  );
                },
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Image.asset(
                  Assets.foodProductScanning,
                  width: 35,
                  height: 35,
                ),
                title: Text(
                  " Food Product Scanning",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScannerScreen(scanType: ScanType.foodProduct)),
                  );
                },
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Image.asset(
                  Assets.medicationIntakeSummary,
                  width: 35,
                  height: 35,
                ),
                title: Text(
                  "Medication Scanning",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScannerScreen(scanType: ScanType.medicine)),
                  );
                },
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Image.asset(
                  Assets.supplementIntakeSummary,
                  width: 35,
                  height: 35,
                ),
                title: Text(
                  "Supplement Scanning",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScannerScreen(scanType: ScanType.supplement)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
