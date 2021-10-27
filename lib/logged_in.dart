import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/login_screen.dart';

class LoggedIn extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoggedIn'),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.white.withOpacity(0.7),
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'You are logged in',
          style: TextStyle(
              color: Colors.teal, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
