import 'package:maaredh/di/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageServices {
  // Create Secure Storage
  // final secureStorage = const FlutterSecureStorage();

  StorageServices._internal();

  static final StorageServices _instance = StorageServices._internal();

  factory StorageServices() => _instance;

  saveToStorage(String storageKey, var storageValue) => getIt<SharedPreferences>().setString(storageKey, storageValue);

  readFromStorage(String storageKey) => getIt<SharedPreferences>().getString(storageKey);

  removeFromStorage(String storageKey) => getIt<SharedPreferences>().remove(storageKey);

  // saveWithSecureStorage(String storageKey, var storageValue) async => await secureStorage.write(key: storageKey, value: storageValue);
  //
  // readWithSecureStorage(String storageKey) async => await secureStorage.read(key: storageKey);
  //
  // removeWithSecureStorage(String storageKey) async => await secureStorage.delete(key: storageKey);

  clearStorage() {
    // secureStorage.deleteAll();
    getIt<SharedPreferences>().clear();
  }
}
