import 'package:flutter/material.dart';
import 'package:tadbirrah/constants/assets.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';

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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 400,
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
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'محتار هتطبخ ايه النهاردة؟',
                    style:
                        AppTextStyles.semiBold24, // Use the defined text style
                  ),
                ),
                AppSizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'دلوقتي تقدر تختار وجبتك المفضلة من غير ما تقعد تدور على وصفات كتير',
                    style:
                        AppTextStyles.regular14, // Use the defined text style
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
