import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup/bloc/authentication_bloc.dart';
import 'package:signup/splash_screen.dart';

void main() => runApp(BlocProvider(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) return SplashScreen();
          if (state is AuthenticationSuccess) return Text(state.userName);
          if (state is AuthenticationLoading)
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
