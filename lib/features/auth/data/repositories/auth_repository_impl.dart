import 'package:dartz/dartz.dart';
import 'package:maaredh/core/error/exceptions.dart';
import 'package:maaredh/core/error/failures.dart';
import 'package:maaredh/core/network_info/network_info.dart';
import 'package:maaredh/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:maaredh/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:maaredh/features/auth/domain/entities/user_data_entity.dart';
import 'package:maaredh/features/auth/domain/repositories/auth_repository.dart';
import 'package:maaredh/features/auth/domain/usecases/user_sign_in.dart';

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocaleDataSource;

  AuthRepositoryImpl({required this.networkInfo, required this.authRemoteDataSource, required this.authLocaleDataSource});

  @override
  Future<Either<Failure, UserEntity>>? userSignIn(LoginParams loginParams) async {
    /// check if the device connected to network then get remote data and cache the data
    /// else get the data from cache if exist
    if (await networkInfo.isConnected) {
      try {
        final remoteAuthDataSource = await authRemoteDataSource.userSignIn();
        authLocaleDataSource.cacheUser(remoteAuthDataSource);
        return Right(remoteAuthDataSource);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheAuthDataSource = await authLocaleDataSource.cacheUserSignIn();
        return Right(cacheAuthDataSource);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
