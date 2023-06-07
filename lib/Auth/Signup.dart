import 'dart:math';

import 'package:facebook_ui/Appbar/Appbar.dart/appbar.dart';
import 'package:facebook_ui/Auth/signin.dart';
import 'package:facebook_ui/Auth/utile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _email = TextEditingController();

  final _password = TextEditingController();

  final formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Column(
        children: [
          Text('Signup'),
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
                    decoration: const InputDecoration(
                      label: Text('name'),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
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
                    loading = true;
                  });
                  auth
                      .createUserWithEmailAndPassword(
                          email: _email.text, password: _password.text)
                      .then((value) {
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading = false;
                    });

                    utilse().toastmessage(error.toString());
                  });

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signin()));
                }
              },
              child: loading
                  ? CircularProgressIndicator(
                      strokeWidth: 4,
                      backgroundColor: Colors.white,
                    )
                  : Text('Sign up')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => signin()));
              },
              child: Text('go to login page'))
        ],
      ),
    );
  }
}
