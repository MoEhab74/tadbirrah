import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheHelper {
  final FlutterSecureStorage secureStorage;

  SecureCacheHelper({required this.secureStorage});

  Future<void> writeSecureData({
    required String key,
    required String value,
  }) async {
    await secureStorage.write(
      key: key,
      value: value,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<String?> readSecureData({required String key}) async {
    return await secureStorage.read(
      key: key,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<void> deleteSecureData({required String key}) async {
    await secureStorage.delete(
      key: key,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<void> clearAllSecureData() async {
    await secureStorage.deleteAll(
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<bool> containsKey({required String key}) async {
    return await secureStorage.containsKey(
      key: key,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }
}
