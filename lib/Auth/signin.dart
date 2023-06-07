import 'package:facebook_ui/Appbar/Appbar.dart/appbar.dart';
import 'package:facebook_ui/Auth/Signup.dart';
import 'package:facebook_ui/Auth/utile.dart';
import 'package:facebook_ui/homescreen/HomeScreen.dart';
import 'package:facebook_ui/realtimedata/realtimedata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final _email = TextEditingController();

  final _password = TextEditingController();

  final formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('signin'),
      ),
      body: Column(
        children: [
          Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter something';
                      } else {
                        return null;
                      }
                    },
                    controller: _email,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _password,
                    validator: (value) {
                      if (value == null || value.isNotEmpty) {
                        return null;
                      } else {
                        return 'enter password';
                      }
                    },
                    decoration: const InputDecoration(
                      label: Text('password'),
                      prefixIcon: Icon(Icons.person),
                    ),
                  )
                ],
              )),
          ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  setState(() {
                    isloading = true;
                  });

                  auth
                      .signInWithEmailAndPassword(
                          email: _email.text, password: _password.text)
                      .then((value) {
                    setState(() {
                      isloading = false;
                    });
                    utilse().toastmessage(value.user!.email.toString());
                  }).onError((error, stackTrace) {
                    setState(() {
                      isloading = false;
                    });

                    utilse().toastmessage(error.toString());
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    User? user = FirebaseAuth.instance.currentUser;
                    return user == null ? Text('USER signout') : firestores();
                  }));
                }
              },
              child: isloading
                  ? CircularProgressIndicator(
                      strokeWidth: 4,
                      backgroundColor: Colors.white,
                    )
                  : Text('Sign in')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => signup()));
              },
              child: Text(' go to Signup page'))
        ],
      ),
    );
  }
}
