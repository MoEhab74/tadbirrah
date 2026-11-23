import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:tadbirrah/features/auth/presentation/widgets/register_form_widget.dart';

class FormContainerWidget extends StatelessWidget {
  const FormContainerWidget({super.key, required this.isLogin});
  final bool
      isLogin; // This should be managed by the parent widget or state management solution.

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              alignment: Alignment.topCenter,
              child: child,
            ),
          );
        },
        child: isLogin
            ? const LoginFormWidget(key: ValueKey('login_form'))
            : const RegisterFormWidget(key: ValueKey('register_form')),
      ),
    );
  }
}
