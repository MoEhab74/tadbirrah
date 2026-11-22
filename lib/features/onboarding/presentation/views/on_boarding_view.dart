import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tadbirrah/constants/assets.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_buttom.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
import 'package:tadbirrah/features/onboarding/presentation/widgets/onboarding_container_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppSizedBox(height: 32),
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets
                          .assetsImagesMeal), // Replace with your onboarding image asset
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const AppSizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'محتارين هتطبخو ايه ',
                          style: AppTextStyles.semiBold24.copyWith(
                            color: AppColors.onSurface,
                          ),
                        ),
                        TextSpan(
                          text: 'النهاردة؟',
                          style: AppTextStyles.semiBold24.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ), // Use the defined text style
                  ),
                ),
                const AppSizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'مع ',
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                        TextSpan(
                          text: 'تدبيره ',
                          style: AppTextStyles.semiBold14.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text:
                              'هتقدروا تقرروا الغدا هيكون ايه حسب مكونات المطبخ وميزانية البيت',
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ], // Use the defined text style
                    ),
                  ),
                ),
                const AppSizedBox(height: 32),
                const OnBoardingContainerWidget(
                  icon: HugeIcons.strokeRoundedLightbulb,
                  title:
                      'سؤال بيتكم المعتاد "هناكل ايه النهاردة ؟" اتحل مع تدبيرة',
                ),
                const AppSizedBox(height: 16),
                const OnBoardingContainerWidget(
                  icon: HugeIcons.strokeRoundedChefHat,
                  title: 'مقترحات حسب مخزونك',
                  subtitle:
                      'استغلي كل صنف في تلاجتك قبل ما يبوظ،وأعملي بيه أحلى صواني وطواجن.',
                ),
                const AppSizedBox(height: 16),
                const OnBoardingContainerWidget(
                  icon: HugeIcons.strokeRoundedSaveMoneyPound,
                  title: 'توفير حقيقي في الميزانية',
                  subtitle:
                      'حساب ذكي لتكلفة الوجبة بالجنيه المصري، وحصر دقيق لقائمة النواقص الأساسية فقط بدون هدر.',
                ),
                const AppSizedBox(height: 16),
                const OnBoardingContainerWidget(
                  icon: HugeIcons.strokeRoundedHome01,
                  title: 'حساب موحد لأهل البيت',
                  subtitle:
                      'شاركي الوجبات المقترحة مع باقي اهل البيت عشان تقررو سوا ايه الغدا',
                ),
                const AppSizedBox(height: 40),
                AppButton(
                  onPressed: () {
                    // Navigate to the next screen or perform any action
                  },
                  text: 'ابدأ دلوقتي',
                  icon: HugeIcons.strokeRoundedCookingPot,
                ),
                const AppSizedBox(height: 16),
                AppButton(
                  onPressed: () {
                    // Navigate to the next screen or perform any action
                  },
                  text: 'عندك حساب بالفعل؟',
                  backgroundColor: AppColors.surfaceContainerLow,
                  textColor: AppColors.onSurfaceVariant,
                ),
                const AppSizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HugeIcon(
                      size: 20.sp,
                      color: AppColors.onSurfaceVariant,
                      icon: HugeIcons.strokeRoundedHeart,
                    ),
                    const AppSizedBox(width: 4),
                    Text(
                      'مصنوع بكل حب لكل مطبخ مصري أصيل',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors
                            .onSurfaceVariant, // Use the defined text style and color
                      ),
                    ),
                  ],
                ),
                const AppSizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
