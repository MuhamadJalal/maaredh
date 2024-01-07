import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maaredh/core/locale/usecases/change_locale.dart';
import 'package:maaredh/core/locale/usecases/save_locale.dart';
import 'package:maaredh/core/usecases/usecase.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

part 'locale_event.dart';

part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final ChangeLocaleUseCase changeLocaleUseCase;
  final GetSavedLocaleUseCase getSavedLocaleUseCase;

  LocaleBloc({required this.changeLocaleUseCase, required this.getSavedLocaleUseCase}) : super(const ChangeLocaleState(Locale('en'))) {
    on<LocaleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  String currentLocale = 'en';

  /// get saved locale from shared preferences
  Future<void> getSavedLocale() async {
    final response = await getSavedLocaleUseCase.call(NoParams());
    response.fold((failure) => 'failure: ${failure.toString()}'.debug(this), (value) {
      currentLocale = value;
      emit(ChangeLocaleState(Locale(currentLocale)));
    });
  }

  /// change app locale and save to shared preferences
  Future<void> _changeLocale(String langCode) async {
    final response = await changeLocaleUseCase.call(langCode);
    response.fold((failure) => 'failure: ${failure.toString()}'.debug(this), (value) {
      currentLocale = langCode;
      emit(ChangeLocaleState(Locale(currentLocale)));
    });
  }

  void toEnglishLocale() => _changeLocale('en');

  void toArabicLocale() => _changeLocale('ar');
}
