import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import '../../res/common_widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? centerIconAsset;
  final String? trailingIconAsset;
  final VoidCallback onBackPressed;
  final VoidCallback? onTrailingIconPressed;
  final Color? backgroundColor;
  final Color? backButtonColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.centerIconAsset,
    this.trailingIconAsset,
    this.onTrailingIconPressed,
    this.backgroundColor,
    this.backButtonColor,
    required this.onBackPressed,
  })  : assert(title != null || centerIconAsset != null, 'Either title or centerIconAsset must be provided');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 48,
      backgroundColor: backgroundColor ?? AppColors.bgColor,
      elevation: 0,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backButtonColor ?? AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
            width: 40,
            height: 40,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                  onPressed: onBackPressed,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: getWidth() * 0.02),
          Expanded(
            child: centerIconAsset != null
                ? SvgPicture.asset(
              centerIconAsset!,
            )
                : CustomText(
              text: title ?? '',
              textAlign: TextAlign.center,
              fontSize: sizes?.fontSize16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 16),
          if (trailingIconAsset != null)
            GestureDetector(
              onTap: onTrailingIconPressed,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.greyColor,
                    shape: BoxShape.circle,
                  ),
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        trailingIconAsset!,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}