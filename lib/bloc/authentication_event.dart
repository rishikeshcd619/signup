part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {
  get userName => null;

  get userPassword => null;

  get userEmail => null;

  get mobileNumber => null;
}

class Login extends AuthenticationEvent {
  String userName;
  String userPassword;
  String userEmail;
  double mobileNumber;
  Login({
    required this.userName,
    required this.userPassword,
    required this.userEmail,
    required this.mobileNumber,
  });
}
