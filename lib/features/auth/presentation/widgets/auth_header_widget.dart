import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tadbirrah/constants/assets.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppSizedBox(height: 16),
        SvgPicture.asset(
          Assets.assetsIconsAppLogoLight,
          height: 165.h,
          fit: BoxFit.cover,
        ),
        const AppSizedBox(height: 16),
        Text(
          ' أهلا بيكم في تدبيرة',
          style: AppTextStyles.bold22,
        ),
        const AppSizedBox(height: 8),
        Text(
          'رفيقكم اليومي للإجابة على: هناكل إيه النهارده؟',
          style: AppTextStyles.medium14.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
