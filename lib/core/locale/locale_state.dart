part of 'locale_bloc.dart';

abstract class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState({required this.locale});

  @override
  List<Object> get props => [locale];
}

class ChangeLocaleState extends LocaleState {
  final Locale selectedLocale;

  const ChangeLocaleState(this.selectedLocale) : super(locale: selectedLocale);
}

// class ArabicLocaleState extends LocaleState {
//   final Locale selectedLocale;
//
//   const ArabicLocaleState(this.selectedLocale) : super(locale: selectedLocale);
// }
//
// class EnglishLocaleState extends LocaleState {
//   final Locale selectedLocale;
//
//   const EnglishLocaleState(this.selectedLocale) : super(locale: selectedLocale);
// }
