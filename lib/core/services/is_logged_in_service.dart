import '../cache/secure_cache_helper.dart';
import '../utils/app_strings.dart';

class IsLoggedInService {
  final SecureCacheHelper secureCacheHelper;

  IsLoggedInService({required this.secureCacheHelper});

  Future<bool> isLoggedIn() async {
    final token = await secureCacheHelper.readSecureData(key: AppStrings.tokenKey);
    return token != null && token.isNotEmpty;
  }
}
