import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../core/functions/animated_snack_bar.dart';
import '../../../../core/functions/app_warning_dialog.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_styles.dart';
import '../../../../core/widgets/app_sized_box.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 46.r,
                      backgroundColor: AppColors.primaryLight.withValues(alpha: 0.3),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedUser,
                        color: AppColors.primary,
                        size: 44.sp,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.edit, size: 14.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace16,
              Text('Ahmed Ali', style: AppTextStyles.font20SemiBold),
              verticalSpace4,
              Text('ahmed.ali@example.com', style: AppTextStyles.font14Regular),
              verticalSpace32,
              _buildProfileTile(
                context,
                icon: HugeIcons.strokeRoundedSettings01,
                title: 'Account Settings',
                onTap: () {},
              ),
              _buildProfileTile(
                context,
                icon: HugeIcons.strokeRoundedNotification01,
                title: 'Notifications',
                onTap: () {},
              ),
              _buildProfileTile(
                context,
                icon: HugeIcons.strokeRoundedSecurityCheck,
                title: 'Security & Privacy',
                onTap: () {},
              ),
              _buildProfileTile(
                context,
                icon: HugeIcons.strokeRoundedHelpCircle,
                title: 'Help & Support',
                onTap: () {},
              ),
              _buildProfileTile(
                context,
                icon: HugeIcons.strokeRoundedLogout01,
                title: 'Logout',
                iconColor: AppColors.error,
                textColor: AppColors.error,
                onTap: () {
                  showAppWarningDialog(
                    context,
                    title: 'Logout',
                    message: 'Are you sure you want to log out of your account?',
                    confirmText: 'Logout',
                    isDestructive: true,
                    onConfirm: () {
                      AppSnackBar.showInfo(context, message: 'Logged out successfully');
                    },
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

  Widget _buildProfileTile(
    BuildContext context, {
    required dynamic icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDark ? AppColors.grey600.withValues(alpha: 0.3) : AppColors.grey200,
        ),
      ),
      child: ListTile(
        leading: HugeIcon(
          icon: icon,
          color: iconColor ?? AppColors.primary,
          size: 22.sp,
        ),
        title: Text(
          title,
          style: AppTextStyles.font14Medium.copyWith(
            color: textColor ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16.sp,
          color: AppColors.grey400,
        ),
        onTap: onTap,
      ),
    );
  }
}
