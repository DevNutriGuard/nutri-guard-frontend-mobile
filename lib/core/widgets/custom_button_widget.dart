import 'package:flutter/cupertino.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import '../../res/common_widgets.dart';

class CustomWidgetButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? backgroundColor;

  const CustomWidgetButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: getWidth() * 0.9,
        height: getHeight() * 0.06,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: CustomText(
            text: label,
            fontSize: sizes?.fontSize15,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
