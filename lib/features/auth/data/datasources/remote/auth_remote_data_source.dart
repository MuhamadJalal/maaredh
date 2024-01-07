import 'package:maaredh/features/auth/data/models/user_data_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> userSignIn();
}
