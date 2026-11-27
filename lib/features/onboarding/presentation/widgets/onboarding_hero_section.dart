import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tadbirrah/constants/assets.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_radius.dart';
import 'package:tadbirrah/core/theme/styles/app_shadows.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';

class OnBoardingHeroSection extends StatelessWidget {
  const OnBoardingHeroSection({
    super.key,
    required this.heroScale,
    required this.cardFade,
    required this.cardSlide,
  });

  final Animation<double> heroScale;
  final Animation<double> cardFade;
  final Animation<Offset> cardSlide;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    final heroHeight = 330.h + topInset * 0.45;

    return SizedBox(
      height: heroHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Full-bleed editorial meal photograph with gentle zoom-out entrance
          ClipRect(
            child: AnimatedBuilder(
              animation: heroScale,
              builder: (context, child) {
                return Transform.scale(
                  scale: heroScale.value,
                  child: child,
                );
              },
              child: Image.asset(
                Assets.assetsImagesMeal,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),

          // Top subtle dark scrim so status bar & logo pill read cleanly
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: topInset + 72.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.onSurface.withValues(alpha: 0.52),
                    AppColors.onSurface.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          // Bottom multi-stop fade merging seamlessly into AppColors.surface
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 148.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.36, 1.0],
                  colors: [
                    AppColors.surface,
                    AppColors.surface.withValues(alpha: 0.86),
                    AppColors.surface.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          // Floating Glassmorphic Brand Pill
          PositionedDirectional(
            top: topInset + 12.h,
            start: 16.w,
            child: ClipRRect(
              borderRadius: AppRadius.borderFull,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  padding: EdgeInsetsDirectional.fromSTEB(6.w, 5.h, 12.w, 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.onSurface.withValues(alpha: 0.42),
                    borderRadius: AppRadius.borderFull,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.24),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: SvgPicture.asset(
                          Assets.assetsIconsAppLogoIcon,
                          width: 24.w,
                          height: 24.w,
                        ),
                      ),
                      const AppSizedBox(width: 6),
                      Text(
                        'تدبيرة',
                        style: AppTextStyles.semiBold14.copyWith(
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Floating Glassmorphic Live Meal Preview Card
          PositionedDirectional(
            bottom: 12.h,
            start: 16.w,
            end: 16.w,
            child: FadeTransition(
              opacity: cardFade,
              child: SlideTransition(
                position: cardSlide,
                child: const _FloatingMealPreviewCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingMealPreviewCard extends StatefulWidget {
  const _FloatingMealPreviewCard();

  @override
  State<_FloatingMealPreviewCard> createState() =>
      _FloatingMealPreviewCardState();
}

class _FloatingMealPreviewCardState extends State<_FloatingMealPreviewCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ambientController;
  late final Animation<double> _floatOffset;
  late final Animation<double> _dotPulse;

  @override
  void initState() {
    super.initState();
    _ambientController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);

    final curved = CurvedAnimation(
      parent: _ambientController,
      curve: Curves.easeInOutSine,
    );

    _floatOffset = Tween<double>(begin: 0.0, end: -6.0).animate(curved);
    _dotPulse = Tween<double>(begin: 0.25, end: 0.75).animate(curved);
  }

  @override
  void dispose() {
    _ambientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ambientController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatOffset.value.h),
          child: child,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppRadius.borderLg,
          boxShadow: AppShadows.floating,
        ),
        child: ClipRRect(
          borderRadius: AppRadius.borderLg,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 12.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.surface.withValues(alpha: 0.88),
                borderRadius: AppRadius.borderLg,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.72),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            AnimatedBuilder(
                              animation: _dotPulse,
                              builder: (context, _) {
                                return Container(
                                  width: 10.w,
                                  height: 10.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.tertiary.withValues(
                                      alpha: _dotPulse.value * 0.35,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    width: 6.w,
                                    height: 6.w,
                                    decoration: const BoxDecoration(
                                      color: AppColors.tertiary,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const AppSizedBox(width: 6),
                            Flexible(
                              child: Text(
                                'صينية بطاطس بالفراخ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.semiBold14.copyWith(
                                  color: AppColors.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const AppSizedBox(height: 2),
                        Text(
                          '٩٠٪ من تلاجتك • تكفي ٤ أفراد',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.regular12.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const AppSizedBox(width: 10),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.tertiaryFixed,
                      borderRadius: AppRadius.borderMd,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '٨٥ ج.م',
                          style: AppTextStyles.semiBold14.copyWith(
                            color: AppColors.onTertiaryFixed,
                            fontWeight: FontWeight.w700,
                            height: 1.15,
                          ),
                        ),
                        Text(
                          'تكلفة النواقص',
                          style: AppTextStyles.regular12.copyWith(
                            fontSize: 10.sp,
                            color: AppColors.onTertiaryFixedVariant,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
