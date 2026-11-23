import 'package:flutter/material.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';

class AuthBottomWidget extends StatelessWidget {
  const AuthBottomWidget({
    super.key,
    this.onTap,
    required this.text,
    required this.isSelected,
  });
  final void Function()? onTap;
  final String text;
  final bool
      isSelected; // This should be managed by the parent widget or state management solution.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap ?? () {},
      child: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: AppTextStyles.semiBold12.copyWith(
            color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}