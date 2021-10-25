import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup/entity/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationLoading();
      Future.delayed(Duration(seconds: 5));
      yield AuthenticationBegin();
      if (event is Login)
        yield AuthenticationSuccess(
            user: new User(
                name: event.userName,
                password: event.userPassword,
                email: event.userEmail,
                mobileNumber: event.mobileNumber));
    }
  }
}
