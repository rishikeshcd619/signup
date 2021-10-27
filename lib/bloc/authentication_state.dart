part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationBegin extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  User user;

  AuthenticationSuccess({required this.user});
}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  String errorMessage;

  AuthenticationFailure({required this.errorMessage});
}
