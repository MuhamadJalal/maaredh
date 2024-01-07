import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

/// {@template app_bloc_observer}
/// Custom [BlocObserver] that observes all bloc and cubit state changes.
/// {@endtemplate}
class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    'super.onClose(bloc) ${bloc.runtimeType}'.debug(this);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    'super.onError(bloc, event) bloc: ${bloc.runtimeType} error: $error stackTrace: $stackTrace'.debug(this);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    'super.onTransition(bloc, event) bloc: ${bloc.runtimeType} transition: $transition'.debug(this);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    'super.onEvent(bloc, event) bloc: ${bloc.runtimeType} change: $change'.debug(this);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    'super.onEvent(bloc, event) bloc: ${bloc.runtimeType} event: $event'.debug(this);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    'super.onCreate(bloc) ${bloc.state}'.debug(this);
  }
}
