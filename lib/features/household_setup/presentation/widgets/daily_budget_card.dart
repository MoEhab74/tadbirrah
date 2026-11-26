import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';

class DailyBudgetCard extends StatelessWidget {
  const DailyBudgetCard({
    super.key,
    required this.selectedBudget,
    required this.onBudgetSelected,
    this.presets = const [100, 150, 200, 250],
  });

  final int? selectedBudget;
  final ValueChanged<int> onBudgetSelected;
  final List<int> presets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'ميزانية وجبة الغداء الرئيسية (اليومية)',
            style: AppTextStyles.semiBold14.copyWith(
              color: AppColors.onSurface,
            ),
          ),
          const AppSizedBox(height: 12),
          Text(
            selectedBudget != null
                ? '$selectedBudget جنيه مصري'
                : 'اختر ميزانية الغداء',
            style: AppTextStyles.semiBold24.copyWith(
              color: selectedBudget != null
                  ? AppColors.primary
                  : AppColors.outline,
            ),
          ),
          const AppSizedBox(height: 16),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: presets.map((amount) {
              final isSelected = selectedBudget == amount;
              return GestureDetector(
                onTap: () => onBudgetSelected(amount),
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
                    '$amount ج',
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
      ),
    );
  }
}
