import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'place_list.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

//Fo login check

class _LoginState extends State<Login> {
  late String email, password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //for multiple padding
              //heading
              SizedBox(height: 30),
              ClipRRect(
                // ignore: sort_child_properties_last
                borderRadius: BorderRadius.circular(150),
                child: Image.asset(
                  'lib/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white),
                  ),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      onChanged: (value) => email = value,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: "Eg: a@gmail.com",
                        border: InputBorder.none, //to remove the line
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white),
                  ),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: "enter password",
                        border: InputBorder.none, //to remove the line
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                    child: const Text(
                      "login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      try {
                        await auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        // ignore: use_build_context_synchronously
                        await Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => PlacesList()));
                      } on FirebaseAuthException catch (e) {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: const Text("Login Failed"),
                                  content: Text('${e.message}'),
                                ));
                      }
                    }),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text('create a new account')),
            ],
          ),
        ),
      ),
    );
  }
}
