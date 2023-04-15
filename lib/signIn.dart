import 'package:flutter/material.dart';
import 'signUp.dart';
import 'appwrite.dart';
import 'homePage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 140, 0, 80),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: MaterialButton(
                  onPressed: (() {
                    try {
                      authUser(email, password);
                    } catch (e) {}
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homePage(),
                      ),
                    );
                  }),
                  child: Text("SIGN IN"),
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              TextButton(
                  onPressed: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => signUp(),
                      ),
                    );
                  }),
                  child: Text(
                    "Don't have an account? Sign up",
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
