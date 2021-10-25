import 'package:flutter/material.dart';
import 'package:signup/bloc/authentication_bloc.dart';
import 'package:signup/display_screen.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  late String name;
  late String email;
  late String password;
  late String mobileNumber;

  //FormScreenState({required this.name, required this.password, required this.email, required this.mobileNumber})

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final authenticationBloc = AuthenticationBloc();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String? value) {
        email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      obscureText: true,
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        mobileNumber = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildPassword(),
                _buildEmail(),
                _buildPhoneNumber(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'SignUp',
                    style: TextStyle(color: Colors.teal, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DisplayUser(
                            userName: name,
                            userPassword: password,
                            userEmail: email,
                            userMobileNumber: double.parse(mobileNumber),
                          );
                        },
                      ),
                    );
                    //userDisplay(name, email, password, mobileNumber);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//   void userDisplay(String userName, String userEmail, String userPassword,
//       String mobileNumber) {
//     // //final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
//     // authenticationBloc
//     //   ..add(Login(
//     //     userName: name,
//     //     userPassword: password,
//     //     userEmail: email,
//     //     mobileNumber: double.parse(mobileNumber),
//     //   ));

//   }
// }
}
