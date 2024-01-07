abstract class LocaleDataSource {
  Future<bool> changeLocale({required String langCode});

  Future<String> getSavedLocale();
}
