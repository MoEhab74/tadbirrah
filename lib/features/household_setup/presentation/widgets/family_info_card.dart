import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
import 'package:tadbirrah/core/widgets/app_text_field_widget.dart';

class FamilyInfoCard extends StatelessWidget {
  const FamilyInfoCard({
    super.key,
    required this.nameController,
    required this.familySize,
    required this.onIncrement,
    required this.onDecrement,
    this.onNameChanged,
  });

  final TextEditingController nameController;
  final int familySize;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final ValueChanged<String>? onNameChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
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
            'اسم البيت',
            style: AppTextStyles.semiBold12.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const AppSizedBox(height: 8),
          AppTextFormField(
            controller: nameController,
            hintText: 'بيت عائلة أحمد',
            keyboardType: TextInputType.name,
            onChanged: onNameChanged,
          ),
          const AppSizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'عدد أفراد الأسرة',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.onSurface,
                      ),
                    ),
                    const AppSizedBox(height: 4),
                    Text(
                      'لحساب الكميات وتكلفة الوجبة بدقة',
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const AppSizedBox(width: 12),
              Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _StepperButton(
                      icon: Icons.add,
                      isPrimary: true,
                      onTap: onIncrement,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        '$familySize أفراد',
                        style: AppTextStyles.semiBold14.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                    ),
                    _StepperButton(
                      icon: Icons.remove,
                      isPrimary: false,
                      onTap: familySize > 1 ? onDecrement : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({
    required this.icon,
    required this.isPrimary,
    this.onTap,
  });

  final IconData icon;
  final bool isPrimary;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 34.w,
        height: 34.w,
        decoration: BoxDecoration(
          color: isPrimary
              ? AppColors.primary
              : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12.r),
          border: isPrimary
              ? null
              : Border.all(
                  color: AppColors.outlineVariant.withValues(alpha: 0.5),
                ),
        ),
        child: Icon(
          icon,
          size: 18.sp,
          color: isPrimary
              ? AppColors.onPrimary
              : isDisabled
                  ? AppColors.outlineVariant
                  : AppColors.primary,
        ),
      ),
    );
  }
}
