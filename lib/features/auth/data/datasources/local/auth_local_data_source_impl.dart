import 'dart:convert';

import 'package:maaredh/core/error/exceptions.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';
import 'package:maaredh/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:maaredh/features/auth/data/models/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  void cacheUser(UserModel remoteAuthDataSource) {
    sharedPreferences.setString(AppRepoSharedPrefKeys().userDataSharedPrefKey, json.encode(remoteAuthDataSource));
  }

  @override
  Future<UserModel> cacheUserSignIn() {
    final jsonString = sharedPreferences.getString(AppRepoSharedPrefKeys().userDataSharedPrefKey);

    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
