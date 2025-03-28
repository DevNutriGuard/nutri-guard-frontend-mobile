import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_colors.dart';
import '../../../res/assets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: widget.currentIndex >= 0 ? AppColors.silverTextColor.withOpacity(0.5) : Colors.transparent,
                width: 1,
              ),
            ),
            color: AppColors.whiteColor,
          ),
          child: BottomNavigationBar(
            currentIndex: widget.currentIndex,
            onTap: widget.onTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  widget.currentIndex == 0 ? Icons.spa : Icons.spa_outlined,
                ),
                label: 'Wellness',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  widget.currentIndex == 1 ? Icons.local_dining : Icons.local_dining_outlined,
                ),
                label: 'Nutrition',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(width: 56), // Placeholder for center scanner button
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  widget.currentIndex == 3 ? Icons.fitness_center : Icons.fitness_center_outlined,
                ),
                label: 'Fitness',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  widget.currentIndex == 4 ? Icons.description : Icons.description_outlined,
                ),
                label: 'Reports',
              ),
            ],
          ),
        ),
        // Centered Scanner Button
        Positioned(
          top: 1,
          child: Container(
            width: 53,
            height: 53,
            decoration: BoxDecoration(
              color: AppColors.bgContainerSmallColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(Assets.scanIcon,),
            )
          ),
        ),
      ],
    );
  }
}
