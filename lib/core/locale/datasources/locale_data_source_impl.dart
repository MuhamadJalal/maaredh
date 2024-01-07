import 'package:maaredh/core/locale/datasources/locale_data_source.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleDataSourceImpl extends LocaleDataSource {
  final SharedPreferences sharedPreferences;

  LocaleDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> changeLocale({required String langCode}) async => await sharedPreferences.setString(AppRepoSharedPrefKeys().languageCodeSharedPref, langCode);

  @override
  Future<String> getSavedLocale() async => sharedPreferences.getString(AppRepoSharedPrefKeys().languageCodeSharedPref) ?? 'en';
}
