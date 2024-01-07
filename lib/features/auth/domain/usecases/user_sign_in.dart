import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:maaredh/core/error/failures.dart';
import 'package:maaredh/core/usecases/usecase.dart';

import '../entities/user_data_entity.dart';
import '../repositories/auth_repository.dart';

class UserSignIn implements UseCase<UserEntity, LoginParams> {
  final UserSignInRepository userSignInRepository;

  const UserSignIn({required this.userSignInRepository});

  @override
  Future<Either<Failure, UserEntity>>? call(LoginParams loginParams) => userSignInRepository.userSignIn(loginParams);
}

class LoginParams extends Equatable {
  final String userName;
  final String password;

  const LoginParams({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}
