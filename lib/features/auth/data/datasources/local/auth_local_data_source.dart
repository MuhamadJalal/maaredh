import 'package:maaredh/features/auth/data/models/user_data_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> cacheUserSignIn();

  void cacheUser(UserModel remoteAuthDataSource);
}
