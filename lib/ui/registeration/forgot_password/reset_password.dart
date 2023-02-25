import 'package:flutter/material.dart';
import 'package:google_map/utils/big_text.dart';
import 'package:google_map/utils/dimension.dart';
import 'package:google_map/utils/small_text.dart';
import 'package:google_map/widget/button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _email=new TextEditingController();
  final TextEditingController _password=new TextEditingController();
  bool isVisible_1=true;
  bool isVisible_2=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVisible_1=true;
    isVisible_2=true;
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
              child: BigText(text: "Reset Password"),
            ),
            Container(
                width: dimension.width30*10,
                margin: EdgeInsets.only(left: dimension.width20, top: dimension.height10),
                child: SmallText(text: "Enter a new password to change", alignment: TextAlign.start,)
            ),
            Container(
              margin: EdgeInsets.only(left: dimension.height20,right: dimension.height20,top: dimension.height45*1.4),
              child: TextField(
                controller: _email,
                obscureText: isVisible_1,
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: dimension.font16*1.2
                ),
                decoration: InputDecoration(
                  labelText: "New Password",
                  filled: true,
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isVisible_1=!isVisible_1;
                    });
                  }, icon: !isVisible_1?Icon(Icons.visibility):Icon(Icons.visibility_off)),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(dimension.width10)
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: dimension.height20, vertical: dimension.height20),
              child: TextField(
                cursorColor: Colors.black,
                obscureText: isVisible_2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: dimension.font16*1.2
                ),
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  filled: true,
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isVisible_2=!isVisible_2;
                    });
                  }, icon: !isVisible_2?Icon(Icons.visibility):Icon(Icons.visibility_off)),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
                      }, text: "Change Password",height: dimension.height45*1.1),
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
