import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';

class AuthFooterSectionWidget extends StatelessWidget {
  const AuthFooterSectionWidget({
    super.key,
    this.onGooglePressed,
  });

  final VoidCallback? onGooglePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _AuthOrDividerWidget(),
        const AppSizedBox(height: 20),
        _GoogleSignInButton(onPressed: onGooglePressed),
        const AppSizedBox(height: 20),
        const _FamilyAccountInfoCard(),
      ],
    );
  }
}

class _AuthOrDividerWidget extends StatelessWidget {
  const _AuthOrDividerWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.outlineVariant,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            'أو المتابعة عبر',
            style: AppTextStyles.regular12.copyWith(
              color: AppColors.outline,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.outlineVariant,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: OutlinedButton(
        onPressed: onPressed ?? () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.surfaceContainerLowest,
          side: const BorderSide(
            color: AppColors.outlineVariant,
            width: 1.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
        ),
        child: Text(
          'المتابعة باستخدام حساب Google',
          style: AppTextStyles.semiBold14.copyWith(
            color: AppColors.onSurface,
          ),
        ),
      ),
    );
  }
}

class _FamilyAccountInfoCard extends StatelessWidget {
  const _FamilyAccountInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'حساب واحد يكفي البيت كله',
            style: AppTextStyles.semiBold14.copyWith(
              color: AppColors.primary,
            ),
          ),
          const AppSizedBox(height: 6),
          Text(
            'سجّل حساب أسرتك مرة واحدة لإدارة المكونات والميزانية، وكل أفراد العيلة يقدروا يصوّتوا على غداء النهارده من نفس الموبايل.',
            style: AppTextStyles.regular12.copyWith(
              color: AppColors.onSurfaceVariant,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
