class AppRepoSharedPrefKeys {
  AppRepoSharedPrefKeys._internal();

  static final AppRepoSharedPrefKeys _instance = AppRepoSharedPrefKeys._internal();

  factory AppRepoSharedPrefKeys() => _instance;

  String languageCodeSharedPref = 'languageCode';
  String countryCodeSharedPref = 'countryCode';

  final String accessTokenSharedPrefKey = 'accessTokenSharedPrefKey';

  final String userIdSharedPrefKey = 'userIdSharedPrefKey';
  final String userEmailSharedPrefKey = 'userEmailSharedPrefKey';
  final String userPasswordSharedPrefKey = 'userPasswordSharedPrefKey';

  final String userDataSharedPrefKey = 'userDataSharedPrefKey';
  final String isLogInSharedPrefKey = 'isLogInSharedPrefKey';
  final String appThemeSharedPrefKey = 'appThemeSharedPrefKey';
  final String userImagePathSharedPrefKey = 'userImagePathSharedPrefKey';
}
