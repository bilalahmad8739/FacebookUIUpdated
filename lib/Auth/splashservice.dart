import 'dart:async';

import 'package:facebook_ui/Auth/signin.dart';
import 'package:facebook_ui/homescreen/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class splashservicess
{
  void services(BuildContext context){
    
    FirebaseAuth auth = FirebaseAuth.instance;
    final user= auth.currentUser;
    if(user!=null)
    {
      Timer(Duration(seconds: 5), () { Navigator.push(context, MaterialPageRoute(builder: ((context)=>HomeScreen()) ));
});

      
    }
    else
    {
      Timer(Duration(seconds: 5), () { Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));});
    }

  }

}
