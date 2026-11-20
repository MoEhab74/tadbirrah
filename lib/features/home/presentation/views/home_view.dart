import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/animated_snack_bar.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_styles.dart';
import '../../../../core/widgets/app_buttom.dart';
import '../../../../core/widgets/app_sized_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tadbirrah Home'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back! 👋',
                style: AppTextStyles.font24Bold,
              ),
              verticalSpace8,
              Text(
                'Explore your tasks, manage features and stay organized.',
                style: AppTextStyles.font14Regular,
              ),
              verticalSpace24,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clean Architecture Ready',
                      style: AppTextStyles.font20SemiBold.copyWith(color: Colors.white),
                    ),
                    verticalSpace8,
                    Text(
                      'Feature-First structure with robust Core, Dio networking, GetIt DI, and GoRouter StatefulShellRoute.',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace32,
              Text(
                'Quick Actions',
                style: AppTextStyles.font18Medium.copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpace16,
              AppButton(
                text: 'Test Animated SnackBar',
                onPressed: () {
                  AppSnackBar.showSuccess(
                    context,
                    message: 'Architecture setup successfully working!',
                  );
                },
              ),
              verticalSpace16,
              AppButton(
                text: 'Warning SnackBar',
                backgroundColor: AppColors.warning,
                onPressed: () {
                  AppSnackBar.showWarning(
                    context,
                    message: 'This is a sample warning snackbar.',
                  );
                },
              ),
              verticalSpace48,
            ],
          ),
        ),
      ),
    );
  }
}
