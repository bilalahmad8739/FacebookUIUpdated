import 'dart:async';
import 'dart:math';


import 'package:facebook_ui/Auth/splashservice.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';



class splashscreens extends StatefulWidget {
  const splashscreens({super.key});

  @override
  State<splashscreens> createState() => _splashscreensState();
}

class _splashscreensState extends State<splashscreens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('call');
    splashservicess().services(context);
  //  splashservices.services(context);

   
  }


  @override
  Widget build(BuildContext context) {
    return SplashScreen(

      
      seconds: 5,
      backgroundColor: Colors.blue,
      // navigateAfterSeconds: signup(),
      loaderColor: Colors.white,
      image: Image.network(
        'https://logolook.net/wp-content/uploads/2021/06/Facebook-Logo.png',),


 photoSize: 200,
 title: Text('Meta ',style: TextStyle(color: Colors.white,fontSize: 30),),
    );
  }
}