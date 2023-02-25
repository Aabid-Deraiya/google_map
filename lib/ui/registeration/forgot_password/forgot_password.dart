import 'dart:async';

import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/ui/registeration/forgot_password/waiting_screen.dart';
import 'package:google_map/utils/dimension.dart';

import '../../../utils/big_text.dart';
import '../../../utils/small_text.dart';
import '../../../utils/toast.dart';
import '../../../widget/button.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _email=new TextEditingController();
  final TextEditingController otp=new TextEditingController();
  final _auth = FirebaseAuth.instance;
  Future<void> resetPassword({required String email}) async {
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WaitingScreen()));
    })
        .catchError((e){
      authToast(Colors.red).toastMessage(e.toString());
    });
    return;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: dimension.width20, top: dimension.height30),
              child: BigText(text: "Forgot Password"),
            ),
            Container(
              width: dimension.width30*10,
              margin: EdgeInsets.only(left: dimension.width20, top: dimension.height10),
              child: SmallText(text: "Please use email to reset your password", alignment: TextAlign.start,)
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: dimension.height20,vertical: dimension.height20),
              child: TextFormField(
                controller: _email,
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: dimension.font16*1.2
                ),
                decoration: InputDecoration(
                  labelText: "Enter Email",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(dimension.width10)
                  ),
                ),
              ),
            ),
            Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: dimension.width20),
                    child: Button(onTap: (){
                      resetPassword(email: _email.text);
                    }, text: "Continue",height: dimension.height45*1.1),
                  )
                )
            ),
            SizedBox(height: dimension.height20,)
          ],
        ),
      ),
    );
  }
}
