import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/styles/app_colors.dart';
import '../theme/styles/app_shadows.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<IconData> _icons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Container(
        height: 64.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surface,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: AppShadows.floating,
          border: Border.all(
            color: isDark
                ? AppColors.outlineVariant.withValues(alpha: 0.2)
                : AppColors.outlineVariant.withValues(alpha: 0.4),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final isSelected = currentIndex == index;

            return IconButton(
              onPressed: () => onTap(index),
              padding: EdgeInsets.all(8.w),
              constraints: BoxConstraints(minWidth: 48.w, minHeight: 48.h),
              icon: Icon(
                _icons[index],
                size: 24.sp,
                color: isSelected
                    ? (isDark ? AppColors.inversePrimary : AppColors.primary)
                    : AppColors.outline,
              ),
            );
          }),
        ),
      ),
    );
  }
}
