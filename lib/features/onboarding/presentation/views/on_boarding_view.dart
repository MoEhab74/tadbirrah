import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tadbirrah/core/routing/app_routes.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_radius.dart';
import 'package:tadbirrah/core/theme/styles/app_shadows.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_buttom.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
import 'package:tadbirrah/features/onboarding/presentation/widgets/onboarding_hero_section.dart';
import 'package:tadbirrah/features/onboarding/presentation/widgets/onboarding_pillar_card.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _heroScale;
  late final Animation<double> _cardFade;
  late final Animation<Offset> _cardSlide;
  late final Animation<double> _contentFade;
  late final Animation<Offset> _contentSlide;
  late final Animation<double> _ctaFade;
  late final Animation<Offset> _ctaSlide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    );

    _heroScale = Tween<double>(begin: 1.08, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.75, curve: Curves.easeOutCubic),
      ),
    );

    _cardFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.22, 0.65, curve: Curves.easeOut),
      ),
    );
    _cardSlide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.22, 0.65, curve: Curves.easeOutCubic),
      ),
    );

    _contentFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.80, curve: Curves.easeOut),
      ),
    );
    _contentSlide = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.80, curve: Curves.easeOutCubic),
      ),
    );

    _ctaFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
      ),
    );
    _ctaSlide = Tween<Offset>(
      begin: const Offset(0, 0.16),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Full-bleed Hero with Brand Pill & Floating Meal Preview
                      OnBoardingHeroSection(
                        heroScale: _heroScale,
                        cardFade: _cardFade,
                        cardSlide: _cardSlide,
                      ),

                      // Headline + Subtitle + 3-Pillar Bento Strip
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20.w,
                        ),
                        child: FadeTransition(
                          opacity: _contentFade,
                          child: SlideTransition(
                            position: _contentSlide,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AppSizedBox(height: 8),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'محتارين هتطبخوا إيه ',
                                          style:
                                              AppTextStyles.semiBold28.copyWith(
                                            color: AppColors.onSurface,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'النهاردة؟',
                                          style:
                                              AppTextStyles.semiBold28.copyWith(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const AppSizedBox(height: 8),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'مع ',
                                          style:
                                              AppTextStyles.regular14.copyWith(
                                            color: AppColors.onSurfaceVariant,
                                            height: 1.6,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'تدبيرة',
                                          style:
                                              AppTextStyles.semiBold14.copyWith(
                                            color: AppColors.primary,
                                            height: 1.6,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '، قرروا الغدا في ثواني حسب اللي في مطبخكم وميزانية البيت.',
                                          style:
                                              AppTextStyles.regular14.copyWith(
                                            color: AppColors.onSurfaceVariant,
                                            height: 1.6,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const AppSizedBox(height: 22),

                                // Compact 3-Column Bento Strip
                                const Row(
                                  children: [
                                    Expanded(
                                      child: OnBoardingPillarCard(
                                        icon: HugeIcons.strokeRoundedChefHat,
                                        iconBackgroundColor:
                                            AppColors.primaryFixed,
                                        iconColor: AppColors.primary,
                                        title: 'حسب تلاجتك',
                                        subtitle: 'بدون هدر',
                                      ),
                                    ),
                                    AppSizedBox(width: 10),
                                    Expanded(
                                      child: OnBoardingPillarCard(
                                        icon: HugeIcons
                                            .strokeRoundedSaveMoneyPound,
                                        iconBackgroundColor:
                                            AppColors.tertiaryFixed,
                                        iconColor:
                                            AppColors.onTertiaryFixedVariant,
                                        title: 'على قد الميزانية',
                                        subtitle: 'بالجنيه المصري',
                                      ),
                                    ),
                                    AppSizedBox(width: 10),
                                    Expanded(
                                      child: OnBoardingPillarCard(
                                        icon: HugeIcons.strokeRoundedHome01,
                                        iconBackgroundColor:
                                            AppColors.surfaceContainerLow,
                                        iconColor: AppColors.secondary,
                                        title: 'رأي أهل البيت',
                                        subtitle: 'تصويت سريع',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      // Pinned Bottom CTA + Warm Footer
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          20.w,
                          20.h,
                          20.w,
                          bottomInset + 16.h,
                        ),
                        child: FadeTransition(
                          opacity: _ctaFade,
                          child: SlideTransition(
                            position: _ctaSlide,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: AppRadius.borderLg,
                                    boxShadow: AppShadows.floating,
                                  ),
                                  child: AppButton(
                                    onPressed: () {
                                      context.pushReplacement(AppRoutes.auth);
                                    },
                                    text: 'ابدأ دلوقتي',
                                    icon: HugeIcons.strokeRoundedCookingPot,
                                    height: 54.h,
                                  ),
                                ),
                                const AppSizedBox(height: 14),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    HugeIcon(
                                      size: 16.sp,
                                      color: AppColors.burntTerracotta,
                                      icon: HugeIcons.strokeRoundedHeart,
                                    ),
                                    const AppSizedBox(width: 6),
                                    Text(
                                      'مصنوع بكل حب لكل مطبخ مصري أصيل',
                                      style: AppTextStyles.medium14.copyWith(
                                        fontSize: 12.sp,
                                        color: AppColors.outline,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
