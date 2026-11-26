import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tadbirrah/core/api/api_endpoints.dart';
import 'core/cache/cache_helper.dart';
import 'core/routing/app_router.dart';
import 'core/services/get_it_service.dart';
import 'core/theme/themes/app_themes.dart';
import 'core/utils/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Initialize SharedPreferences CacheHelper
  await CacheHelper.init();

  // Setup Dependency Injection (GetIt)
  await setupGetIt();

  // Initialize .env
  await dotenv.load(fileName: ".env");

  // Initalize Supabase through get_it service
  await Supabase.initialize(
    url: ApiEndpoints.supabaseUrl,
    publishableKey: ApiKeys.supabasePublishableKey ?? 'YOUR_SUPABASE_PUBLISHABLE_KEY',
  );

  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      startLocale: const Locale('ar'),
      path: 'assets/localization',
      fallbackLocale: const Locale('ar'),
      saveLocale: true,
      child: const TadbirrahApp()));
}

class TadbirrahApp extends StatelessWidget {
  const TadbirrahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: ThemeMode.system,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
