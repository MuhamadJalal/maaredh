import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maaredh/config/locale/app_localizations.dart';
import 'package:maaredh/core/locale/locale_bloc.dart';
import 'package:maaredh/features/auth/presentation/blocs/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.translate('app_name'),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 40.sp),
          ),
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.translate('welcome'),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 30.sp),
                ),
                12.verticalSpace,
                InkWell(
                  onTap: () => AppLocalizations.of(context)!.isEnLocale ? context.read<LocaleBloc>().toArabicLocale() : context.read<LocaleBloc>().toEnglishLocale(),
                  child: Text(
                    'Change Locale',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
