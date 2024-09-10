import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/config/color/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  final String iconSrc;
  final bool isSelected;
  final String? label;
  final void Function()? onTap;
  final bool showBadge;

  const BottomNavItem({
    super.key,
    required this.iconSrc,
    this.isSelected = false,
    this.label,
    this.onTap,
    this.showBadge = false,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 45.h,
                width: 45.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 2.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.primaryColor : Colors.transparent,
                ),
                child: SvgPicture.asset(
                  iconSrc,
                  colorFilter: ColorFilter.mode(
                    isSelected ? Colors.white : AppColors.primarySlate300,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              if (showBadge)
                Positioned(
                  top: -2.h,
                  right: 4.h,
                  child: Container(
                    height: 12.h,
                    width: 12.w,
                    padding: EdgeInsets.all(4.h),
                    decoration: BoxDecoration(
                      border:Border.all(color: Colors.white),
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          if (label != null) Text(label!) else const SizedBox(),
        ],
      ),
    );
  }
}
