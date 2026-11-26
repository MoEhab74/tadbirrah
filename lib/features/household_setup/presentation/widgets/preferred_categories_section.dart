import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';

class PreferredCategoriesSection extends StatelessWidget {
  const PreferredCategoriesSection({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.onCategoryToggled,
  });

  /// Map of DB category key -> UI display label
  final Map<String, String> categories;
  final Set<String> selectedCategories;
  final ValueChanged<String> onCategoryToggled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'الأكلات المفضلة للأسرة',
          style: AppTextStyles.semiBold14.copyWith(
            color: AppColors.onSurface,
          ),
        ),
        const AppSizedBox(height: 12),
        Wrap(
          spacing: 8.w,
          runSpacing: 10.h,
          children: categories.entries.map((entry) {
            final isSelected = selectedCategories.contains(entry.key);
            return GestureDetector(
              onTap: () => onCategoryToggled(entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.outlineVariant,
                    width: 1,
                  ),
                ),
                child: Text(
                  entry.value,
                  style: AppTextStyles.semiBold12.copyWith(
                    color: isSelected
                        ? AppColors.onPrimary
                        : AppColors.onSurfaceVariant,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
