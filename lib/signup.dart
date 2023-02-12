// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpDemo(),
    );
  }
}

class SignUpDemo extends StatefulWidget {
  @override
  _SignUpDemoState createState() => _SignUpDemoState();
}

var _password = '';
var _confirmPassword = '';

class _SignUpDemoState extends State<SignUpDemo> {
  TextEditingController emailEditingController =
      TextEditingController(); //used to grab the email
  TextEditingController passwordEditingController =
      TextEditingController(); //used to grab the password
  TextEditingController confirmEditingController =
      TextEditingController(); //used to check that the passwords match

  @override
  Widget build(BuildContext context) {
    void signUpUser() async {
      if (_password != _confirmPassword) {
        // you can add your statements here
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            action: SnackBarAction(
              label: 'Okay!',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
            content: const Text('Passwords must match!'),
            duration: const Duration(milliseconds: 1500),
            width: 280.0, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))));
      } else {
        // FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        //   email: emailController.text,
        //   password: passwordController.text,
        //   context: context,
        //);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
            child: Center(
              child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/ic_logo.png')),
            ),
          ),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0)
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: emailEditingController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              controller: passwordEditingController,
              onChanged: (value) {
                _password = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 15),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              obscureText: true,
              controller: confirmEditingController,
              onChanged: (value) {
                _confirmPassword = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Confirm Password'),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                signUpUser();
                //When Sign-Up is pressed
                //will route to create account?
              },
              child: Text(
                'Sign Up!',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 130,
          )
        ]),
      ),
    );
  }
}
