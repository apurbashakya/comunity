import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_new
      appBar: AppBar(title: Text('Sign Up'),),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: new Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email ID',
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text('submit'),
                  onPressed: () async {
                    UserCredential authResult;
                    authResult = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
