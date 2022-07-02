import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {

  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  Future<void> saveItemInStorage(
      {required String key, required String value}) async {
     await _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> readItemFromStorage({required String key}) async {
    return await _flutterSecureStorage.read(key: key);
  }
}

class AppStorageKeys {
  static const favoriteList = 'favorite_list';

}
