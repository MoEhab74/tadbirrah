import '../cache/cache_helper.dart';
import '../utils/app_strings.dart';

class OnboardingService {
  bool isOnboardingSeen() {
    return CacheHelper.getBool(key: AppStrings.onboardingSeenKey) ?? false;
  }

  Future<bool> setOnboardingSeen() async {
    return await CacheHelper.saveData(
      key: AppStrings.onboardingSeenKey,
      value: true,
    );
  }
}
