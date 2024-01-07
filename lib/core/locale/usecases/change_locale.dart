import 'package:dartz/dartz.dart';
import 'package:maaredh/core/error/failures.dart';
import 'package:maaredh/core/locale/repositories/locale_repository.dart';
import 'package:maaredh/core/usecases/usecase.dart';

class ChangeLocaleUseCase implements UseCase<bool, String> {
  final LocaleRepository localeRepository;

  ChangeLocaleUseCase({required this.localeRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) => localeRepository.changeLocale(langCode: langCode);
}
