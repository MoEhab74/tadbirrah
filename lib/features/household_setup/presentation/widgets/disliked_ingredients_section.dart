import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';

class DislikedIngredientsSection extends StatelessWidget {
  const DislikedIngredientsSection({
    super.key,
    required this.ingredients,
    required this.selectedIds,
    required this.onIngredientToggled,
    required this.onAddMoreTap,
  });

  /// Map of ingredient id -> Arabic name
  final Map<String, String> ingredients;
  final Set<String> selectedIds;
  final ValueChanged<String> onIngredientToggled;
  final VoidCallback onAddMoreTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'مكونات مش بنحبها (هنستبعدها تلقائياً)',
          style: AppTextStyles.semiBold14.copyWith(
            color: AppColors.onSurface,
          ),
        ),
        const AppSizedBox(height: 12),
        Wrap(
          spacing: 8.w,
          runSpacing: 10.h,
          children: [
            ...ingredients.entries.map((entry) {
              final isSelected = selectedIds.contains(entry.key);
              return GestureDetector(
                onTap: () => onIngredientToggled(entry.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.errorContainer.withValues(alpha: 0.6)
                        : AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.error.withValues(alpha: 0.6)
                          : AppColors.outlineVariant,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.close,
                        size: 14.sp,
                        color: isSelected
                            ? AppColors.error
                            : AppColors.onSurfaceVariant,
                      ),
                      const AppSizedBox(width: 6),
                      Text(
                        entry.value,
                        style: AppTextStyles.semiBold12.copyWith(
                          color: isSelected
                              ? AppColors.error
                              : AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            GestureDetector(
              onTap: onAddMoreTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: AppColors.outlineVariant,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      size: 15.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                    const AppSizedBox(width: 4),
                    Text(
                      'إضافة مكون',
                      style: AppTextStyles.semiBold12.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
