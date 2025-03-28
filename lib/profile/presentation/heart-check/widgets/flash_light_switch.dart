import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class FlashLightSwitch extends StatelessWidget {
  final IconData? icon;
  final String text;
  final bool isSwitchOn;
  final ValueChanged<bool> onToggle;
  final bool isRedBox;

  const FlashLightSwitch({
    Key? key,
    this.icon,
    required this.text,
    required this.isSwitchOn,
    required this.onToggle,
    this.isRedBox = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isRedBox)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Switch(
            value: isSwitchOn,
            onChanged: onToggle,
            activeColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
