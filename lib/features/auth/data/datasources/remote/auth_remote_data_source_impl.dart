import 'package:maaredh/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:maaredh/features/auth/data/models/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SharedPreferences sharedPreferences;

  AuthRemoteDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel> userSignIn() {
    // TODO: implement userSignIn
    throw UnimplementedError();
  }
}
