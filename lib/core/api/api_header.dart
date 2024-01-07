import 'package:maaredh/core/utils/barrel_utils.dart';

Future<Map<String, String>> getHeaders({required bool isAuthed}) async {
  Map<String, String> headers = {
    // 'Content-Type': 'application/json',
    "Accept": 'application/json',
  };

  if (isAuthed) headers.addAll({"Authorization": '${StorageServices().readFromStorage(AppRepoSharedPrefKeys().accessTokenSharedPrefKey)}'});

  return headers;
}
