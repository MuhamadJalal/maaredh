part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class AuthIsLoadingEvent extends AuthEvent {}

class AuthLoadedEvent extends AuthEvent {}

class AuthErrorEvent extends AuthEvent {}
