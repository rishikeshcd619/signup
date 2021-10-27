import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/login_screen.dart';

class DisplayUser extends StatelessWidget {
  final String userName;
  final String userEmail;
  final double userMobileNumber;

  DisplayUser(
      {required this.userName,
      required this.userEmail,
      required this.userMobileNumber});

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
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
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                '$userName',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Email: $userEmail',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'MobileNumber: $userMobileNumber',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
