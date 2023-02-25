import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../ui/info/info_1.dart';
import '../ui/screens/home_screen.dart';

class SplashServices{
  void isLogin(BuildContext context){
    final auth=FirebaseAuth.instance;
    GoogleSignIn _googleSignIn=GoogleSignIn();
    final googleUser=_googleSignIn.currentUser;
    final user=auth.currentUser;
    if(user!=null || googleUser!=null){
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
    }else{
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Info_1()));
      });
    }
  }
}