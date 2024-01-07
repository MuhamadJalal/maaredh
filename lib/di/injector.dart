import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:maaredh/core/api/api_consumer.dart';
import 'package:maaredh/core/api/http_consumer.dart';
import 'package:maaredh/core/locale/datasources/locale_data_source.dart';
import 'package:maaredh/core/locale/datasources/locale_data_source_impl.dart';
import 'package:maaredh/core/locale/locale_bloc.dart';
import 'package:maaredh/core/locale/repositories/locale_repository.dart';
import 'package:maaredh/core/locale/repositories/locale_repository_impl.dart';
import 'package:maaredh/core/locale/usecases/change_locale.dart';
import 'package:maaredh/core/locale/usecases/save_locale.dart';
import 'package:maaredh/core/network_info/network_info.dart';
import 'package:maaredh/core/network_info/network_info_impl.dart';
import 'package:maaredh/core/utils/global_context.dart';
import 'package:maaredh/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:maaredh/features/auth/data/datasources/local/auth_local_data_source_impl.dart';
import 'package:maaredh/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:maaredh/features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:maaredh/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:maaredh/features/auth/domain/repositories/auth_repository.dart';
import 'package:maaredh/features/auth/domain/usecases/user_sign_in.dart';
import 'package:maaredh/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

/// Custom injector that inject all bloc and services.
Future<void> injectorSetup() async {
  /// Features
  /// to recreate the instance every time I call --> use [registerFactory]
  // Blocs
  getIt.registerFactory(() => AuthBloc());
  // Use Cases
  getIt.registerLazySingleton(() => UserSignIn(userSignInRepository: getIt()));

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(networkInfo: getIt(), authRemoteDataSource: getIt(), authLocaleDataSource: getIt()));
  // Data Source
  getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sharedPreferences: getIt()));
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sharedPreferences: getIt()));

  /// Core
  getIt.registerFactory(() => GlobalContext());
  getIt.registerFactory(() => LocaleBloc(changeLocaleUseCase: getIt(), getSavedLocaleUseCase: getIt()));
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: getIt()));
  getIt.registerLazySingleton<ApiConsumer>(() => HttpConsumer(client: getIt()));

  getIt.registerLazySingleton<LocaleRepository>(() => LocaleRepositoryImpl(localeDataSource: getIt()));
  getIt.registerLazySingleton<LocaleDataSource>(() => LocaleDataSourceImpl(sharedPreferences: getIt()));
  getIt.registerLazySingleton<ChangeLocaleUseCase>(() => ChangeLocaleUseCase(localeRepository: getIt()));
  getIt.registerLazySingleton<GetSavedLocaleUseCase>(() => GetSavedLocaleUseCase(localeRepository: getIt()));

  /// External
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
