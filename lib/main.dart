import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cache/cache_helper.dart';
import 'core/routing/app_router.dart';
import 'core/services/get_it_service.dart';
import 'core/theme/themes/app_themes.dart';
import 'core/utils/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences CacheHelper
  await CacheHelper.init();

  // Setup Dependency Injection (GetIt)
  await setupGetIt();

  runApp(const TadbirrahApp());
}

class TadbirrahApp extends StatelessWidget {
  const TadbirrahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
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
