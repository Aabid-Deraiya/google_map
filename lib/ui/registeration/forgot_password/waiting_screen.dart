import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map/ui/registeration/login_screen.dart';
import 'package:google_map/utils/big_text.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

void moveHome(BuildContext context){
  Timer(const Duration(seconds: 6), () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  });
}

class _WaitingScreenState extends State<WaitingScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveHome(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: BigText(text: "Your Reset Password Link Has Been Sent")),
      ),
    );
  }
}
