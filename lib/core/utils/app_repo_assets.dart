class AppRepoAssets {
  AppRepoAssets._internal();

  static final AppRepoAssets _instance = AppRepoAssets._internal();

  factory AppRepoAssets() => _instance;

  final String appFontFamily = 'montserrat';

  /// locale assets
  final String ar = "assets/lang/ar.json";
  final String en = "assets/lang/en.json";

  /// app common images
  final String logoImage = 'assets/images/logo.svg';

  /// home images
  final String backImage = 'assets/images/arrow_back.svg';
}
