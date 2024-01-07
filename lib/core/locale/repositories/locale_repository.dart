import 'package:dartz/dartz.dart';
import 'package:maaredh/core/error/failures.dart';

abstract class LocaleRepository {
  Future<Either<Failure, bool>> changeLocale({required String langCode});

  Future<Either<Failure, String>> getSavedLocale();

// Future<Either<Failure, bool>> saveLocale({required String langCode});
}
