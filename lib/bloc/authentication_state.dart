part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  String userName = " ";
  AuthenticationSuccess({this.userName});
}

class AuthenticationFailure extends AuthenticationState {
  String errorMessage = " ";
  AuthenticationFailure({this.errorMessage});
}

class AuthenticationLoading extends AuthenticationState {}
