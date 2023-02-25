import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_map/ui/registeration/login_screen.dart';
import 'package:google_map/ui/registeration/phone_otp.dart';
import 'package:google_map/ui/registeration/signup_screen.dart';
import 'package:google_map/ui/screens/home_screen.dart';
import 'package:google_map/utils/big_text.dart';
import 'package:google_map/utils/closs_app.dart';
import 'package:google_map/utils/dimension.dart';
import 'package:google_map/utils/small_text.dart';
import 'package:google_map/widget/button.dart';
import 'package:google_map/utils/toast.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading=false;
  final _formKey = GlobalKey<FormState>();
  final closeApp = CloseApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: dimension.height30, left: dimension.width20),
              child: BigText(text: "Welcome Back"),
            ),
            Container(
                margin: EdgeInsets.only(left: dimension.width20),
                child: SmallText(text: "Sign In With Phone No")),
            SizedBox(
              height: dimension.height30,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: dimension.height20,
                          right: dimension.height20,
                          top: dimension.height10),
                      child: TextFormField(
                        controller: _name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Name";
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: dimension.font16 * 1.2),
                        decoration: InputDecoration(
                          labelText: "Name",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 2, color: Colors.white),
                              borderRadius:
                              BorderRadius.circular(dimension.width10)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: dimension.height20,
                          right: dimension.height20,
                          top: dimension.height20),
                      child: TextFormField(
                        controller: _phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Phone No";
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: dimension.font16 * 1.2),
                        decoration: InputDecoration(
                          labelText: "Phone No",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 2, color: Colors.white),
                              borderRadius:
                              BorderRadius.circular(dimension.width10)),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: dimension.height20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: dimension.width20),
              child: Button(
                loading: loading,
                onTap: () {
                  setState(() {
                    loading=true;
                  });
                  _auth.verifyPhoneNumber(
                    phoneNumber: "+91"+_phone.text,
                    verificationCompleted: (_){
                      setState(() {
                        loading=false;
                      });
                    },
                    verificationFailed: (e){
                      print(e.toString());
                      authToast(Colors.red).toastMessage(e.toString());
                      setState(() {
                        loading=false;
                      });
                    },
                    codeSent: (String verification, int? token){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneOTP(verificationId: verification,)));
                      setState(() {
                        loading=false;
                      });
                    },
                    codeAutoRetrievalTimeout: (e){
                      print(e.toString());
                      authToast(Colors.red).toastMessage(e.toString());
                      setState(() {
                        loading=false;
                      });
                    },
                  );
                },
                text: "Send OTP",
                height: dimension.height45 * 1.1,
                width: dimension.screenWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
