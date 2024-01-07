import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
      switch (event.runtimeType) {
        // case (AuthInitialEvent):
        //   return emit(AuthInitialState());
        case (AuthInitialEvent):
          return emit(AuthIsLoadingState());
        case (AuthIsLoadingEvent):
          return emit(const AuthLoadedState(code: 'dsdadas'));
        case (AuthLoadedEvent):
          return emit(const AuthErrorState(msg: 'dsdadas'));
        case (AuthErrorEvent):
          return emit(AuthInitialState());
      }
    });
  }
}
