import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_radius.dart';
import 'package:tadbirrah/core/theme/styles/app_shadows.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';

class OnBoardingPillarCard extends StatelessWidget {
  const OnBoardingPillarCard({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  final List<List<dynamic>> icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 8.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: AppRadius.borderLg,
        border: Border.all(
          color: AppColors.earthenBorder,
          width: 1,
        ),
        boxShadow: AppShadows.resting,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: AppRadius.borderMd,
            ),
            alignment: Alignment.center,
            child: HugeIcon(
              icon: icon,
              color: iconColor,
              size: 20.sp,
            ),
          ),
          const AppSizedBox(height: 8),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold12.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
          ),
          const AppSizedBox(height: 2),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular12.copyWith(
              fontSize: 11.sp,
              color: AppColors.outline,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
