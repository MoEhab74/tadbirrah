import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/styles/app_colors.dart';
import '../theme/styles/app_text_styles.dart';

Future<bool?> showAppWarningDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmText = 'Confirm',
  String cancelText = 'Cancel',
  VoidCallback? onConfirm,
  bool isDestructive = false,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: Theme.of(ctx).colorScheme.surface,
        title: Row(
          children: [
            Icon(
              isDestructive
                  ? Icons.warning_amber_rounded
                  : Icons.info_outline_rounded,
              color: isDestructive ? AppColors.error : AppColors.warning,
              size: 26.sp,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.semiBold14.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(ctx).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: AppTextStyles.regular14.copyWith(
            color: Theme.of(ctx).colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              cancelText,
              style:
                  AppTextStyles.semiBold14.copyWith(color: AppColors.grey600),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isDestructive ? AppColors.error : AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              Navigator.of(ctx).pop(true);
              if (onConfirm != null) onConfirm();
            },
            child: Text(
              confirmText,
              style: AppTextStyles.semiBold14.copyWith(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
