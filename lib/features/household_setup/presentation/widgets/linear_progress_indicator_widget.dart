import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';

class LinearProgressIndicatorWidget extends StatelessWidget {
  const LinearProgressIndicatorWidget({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: progress.clamp(0.0, 1.0)),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        builder: (context, value, _) {
          return LinearProgressIndicator(
            value: value,
            minHeight: 6.h,
            backgroundColor: AppColors.surfaceContainer,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          );
        },
      ),
    );
  }
}
