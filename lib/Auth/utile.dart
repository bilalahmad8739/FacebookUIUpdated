import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utilse{

  void toastmessage(String message)
  {
    Fluttertoast.showToast(msg: message.toString(),toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.blue,
        fontSize: 16.0);
  }
}