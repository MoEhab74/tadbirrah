import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/features/auth/presentation/widgets/auth_bottom_widget.dart';
import 'package:tadbirrah/features/auth/presentation/widgets/auth_moving_widget.dart';

class AuthBottomsBackgroundWidget extends StatelessWidget {
  const AuthBottomsBackgroundWidget({
    super.key,
    required this.isLogin,
    this.onLoginTap,
    this.onRegisterTap,
  });
  final bool isLogin;
  final void Function()? onLoginTap;
  final void Function()? onRegisterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          AuthMovingWidget(
            isLogin: isLogin,
          ),
          Row(
            children: [
              Expanded(
                child: AuthBottomWidget(
                  isSelected: isLogin,
                  onTap: onLoginTap ?? () {},
                  text: 'تسجيل الدخول',
                ),
              ),
              Expanded(
                child: AuthBottomWidget(
                  isSelected: !isLogin,
                  onTap: onRegisterTap ?? () {},
                  text: 'انشاء حساب جديد',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
