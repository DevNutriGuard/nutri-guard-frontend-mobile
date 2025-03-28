import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';

// Reusable Gluten Info Widget
class GlutenInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath; // You can use an asset image or network image

  const GlutenInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.greyShadeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Match the blue color in your image
              ),
            ),
            const SizedBox(height: 8), // Spacing
            // Subtitle (e.g., "Found in most bread unless you choose gluten-free options.")
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600], // Match the grey color in your image
              ),
            ),
            const SizedBox(height: 16), // Spacing
            // Image (e.g., bread assortment)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0), // Rounded image corners
              child: Image.asset(
                imagePath, // Use an asset image or network image
                fit: BoxFit.cover, // Adjust how the image fits
                height: 200, // Adjust height as needed
                width: double.infinity, // Full width
              ),
            ),
          ],
        ),
      ),
    );
  }
}