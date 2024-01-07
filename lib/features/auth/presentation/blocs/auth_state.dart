part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthIsLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final String code;

  const AuthLoadedState({required this.code});

  @override
  List<Object> get props => [code];
}

class AuthErrorState extends AuthState {
  final String msg;

  const AuthErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}
