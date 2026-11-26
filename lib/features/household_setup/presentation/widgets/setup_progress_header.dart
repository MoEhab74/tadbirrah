import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
import 'package:tadbirrah/features/household_setup/presentation/widgets/linear_progress_indicator_widget.dart';

class SetupProgressHeader extends StatelessWidget {
  const SetupProgressHeader({
    super.key,
    required this.completedSteps,
    this.totalSteps = 3,
  });

  final int completedSteps;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final progress = totalSteps == 0 ? 0.0 : completedSteps / totalSteps;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'عرّفنا على بيتك',
              style: AppTextStyles.bold22.copyWith(
                color: AppColors.onSurface,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'خطوة $completedSteps من $totalSteps',
                style: AppTextStyles.semiBold12.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const AppSizedBox(height: 12),
        LinearProgressIndicatorWidget(progress: progress),
      ],
    );
  }
}
