import 'package:dartz/dartz.dart';
import 'package:maaredh/core/error/failures.dart';
import 'package:maaredh/features/auth/domain/entities/user_data_entity.dart';
import 'package:maaredh/features/auth/domain/usecases/user_sign_in.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>>? userSignIn(LoginParams loginParams);
}

class UserSignInRepository extends AuthRepository {
  @override
  Future<Either<Failure, UserEntity>>? userSignIn(LoginParams loginParams) {
    // TODO: implement userSignIn
    throw UnimplementedError();
  }
}
