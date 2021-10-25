import 'package:flutter/material.dart';
import 'package:signup/bloc/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  final AuthenticationState? authenticationState;
  SplashScreen({this.authenticationState});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
