import 'package:flutter/material.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';

class AuthMovingWidget extends StatelessWidget {
  const AuthMovingWidget({
    super.key,
    required this.isLogin,
  });
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      alignment: isLogin
          ? AlignmentDirectional.centerStart
          : AlignmentDirectional.centerEnd,
      child: FractionallySizedBox(
        // 1/2 of the parent width
        widthFactor: 0.5,
        heightFactor: 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.onSurface.withValues(alpha: 0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
