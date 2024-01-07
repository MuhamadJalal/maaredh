import 'package:dartz/dartz.dart';
import 'package:maaredh/core/error/exceptions.dart';
import 'package:maaredh/core/error/failures.dart';
import 'package:maaredh/core/locale/datasources/locale_data_source.dart';
import 'package:maaredh/core/locale/repositories/locale_repository.dart';

class LocaleRepositoryImpl extends LocaleRepository {
  final LocaleDataSource localeDataSource;

  LocaleRepositoryImpl({required this.localeDataSource});

  @override
  Future<Either<Failure, bool>> changeLocale({required String langCode}) async {
    try {
      return Right(await localeDataSource.changeLocale(langCode: langCode));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLocale() async {
    try {
      return Right(await localeDataSource.getSavedLocale());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
