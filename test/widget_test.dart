import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbirrah/core/cache/cache_helper.dart';
import 'package:tadbirrah/core/services/get_it_service.dart';
import 'package:tadbirrah/main.dart';

void main() {
  testWidgets('Test TadbirrahApp startup', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await CacheHelper.init();
    await setupGetIt();

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        startLocale: const Locale('ar'),
        path: 'assets/localization',
        fallbackLocale: const Locale('ar'),
        child: const TadbirrahApp(),
      ),
    );
    await tester.pumpAndSettle();
  });
}
