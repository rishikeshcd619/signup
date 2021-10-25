import 'dart:ui';

import 'package:flutter/material.dart';

class DisplayUser extends StatelessWidget {
  final String userName;
  final String userPassword;
  final String userEmail;
  final double userMobileNumber;

  DisplayUser(
      {required this.userName,
      required this.userPassword,
      required this.userEmail,
      required this.userMobileNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
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
                style: TextStyle(color: Colors.teal),
              ),
              Text(
                'MobileNumber: $userMobileNumber',
                style: TextStyle(color: Colors.teal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
