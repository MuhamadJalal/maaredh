import 'package:dartz/dartz.dart';
import 'package:maaredh/core/error/failures.dart';
import 'package:maaredh/core/locale/repositories/locale_repository.dart';
import 'package:maaredh/core/usecases/usecase.dart';

class GetSavedLocaleUseCase implements UseCase<String, NoParams> {
  final LocaleRepository localeRepository;

  GetSavedLocaleUseCase({required this.localeRepository});

  @override
  Future<Either<Failure, String>> call(NoParams noParams) => localeRepository.getSavedLocale();
}
