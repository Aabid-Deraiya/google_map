import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class authToast {
  Color color;

  authToast(this.color);

  void toastMessage(String message) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
        msg: message,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color==null?Colors.red:color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
