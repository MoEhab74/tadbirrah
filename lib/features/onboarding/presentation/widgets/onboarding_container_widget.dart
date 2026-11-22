import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
class OnBoardingContainerWidget extends StatelessWidget {
  const OnBoardingContainerWidget({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });
  final List<List<dynamic>> icon;
  final String title;
  final String? subtitle; // You can change this to any icon you want

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.secondaryFixed, // Use the defined color
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.secondaryContainer
                .withValues(alpha: 0.5), // Use the defined color with opacity
            // Use hugeIcon better
            child: HugeIcon(
              size: 24.sp,
              color: AppColors.onSecondaryContainer,
              icon: icon, // Use the defined color
            ),
          ),
          const AppSizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: AppTextStyles.semiBold14.copyWith(
                      color: AppColors
                          .onPrimaryFixed), // Use the defined text style and color
                ),
                const AppSizedBox(height: 4),
                subtitle != null
                    ? Text(
                        subtitle!,
                        style: AppTextStyles.regular12.copyWith(
                            color: AppColors
                                .onPrimaryFixed), // Use the defined text style and color
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
