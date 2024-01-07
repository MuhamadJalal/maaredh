import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/config/locale/app_localizations_setup.dart';
import 'package:maaredh/config/routes/app_routes.dart';
import 'package:maaredh/config/theme/app_theme.dart';
import 'package:maaredh/core/locale/locale_bloc.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';
import 'package:maaredh/di/injector.dart';

class MaaredhApp extends StatelessWidget {
  const MaaredhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LocaleBloc>()..getSavedLocale()),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        buildWhen: (previousState, currentState) => previousState != currentState,
        builder: (context, state) => ScreenUtilInit(
            builder: (_, child) => MaterialApp(
                  title: 'Maaredh',
                  navigatorKey: GlobalContext().navigatorKey,
                  debugShowCheckedModeBanner: false,
                  theme: appTheme(),
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                  locale: state.locale,
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
                  localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
                )),
      ),
    );
  }
}
