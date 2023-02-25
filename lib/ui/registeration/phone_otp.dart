import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_map/ui/screens/home_screen.dart';
import 'package:google_map/utils/dimension.dart';

import '../../utils/big_text.dart';
import '../../utils/closs_app.dart';
import '../../utils/small_text.dart';
import '../../utils/toast.dart';
import '../../widget/button.dart';
import 'login_screen.dart';

class PhoneOTP extends StatefulWidget {
  String verificationId;
  PhoneOTP({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<PhoneOTP> createState() => _PhoneOTPState();
}

class _PhoneOTPState extends State<PhoneOTP> {
  final TextEditingController _otp = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading=false;
  final _formKey = GlobalKey<FormState>();
  final closeApp = CloseApp();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => closeApp.onWillPop(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: dimension.height30, left: dimension.width20),
                child: BigText(text: "Enter OTP"),
              ),
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
                            top: dimension.height20),
                        child: TextFormField(
                          controller: _otp,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter OTP";
                            }
                            return null;
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: dimension.font16 * 1.2),
                          decoration: InputDecoration(
                            labelText: "OTP",
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
                  onTap: () async{
                    setState(() {
                      loading=true;
                    });
                    final crendital=PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: _otp.text.toString());
                    try{
                      await _auth.signInWithCredential(crendital);
                    }catch(e){
                      setState(() {
                        loading=false;
                      });
                      print(e.toString());
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  text: "Verify OTP",
                  height: dimension.height45 * 1.1,
                  width: dimension.screenWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
