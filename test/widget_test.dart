import 'package:flutter_test/flutter_test.dart';
import 'package:tadbirrah/main.dart';
import 'package:tadbirrah/core/cache/cache_helper.dart';
import 'package:tadbirrah/core/services/get_it_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Test TadbirrahApp startup', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await CacheHelper.init();
    await setupGetIt();

    await tester.pumpWidget(const TadbirrahApp());
    await tester.pumpAndSettle();
  });
}
