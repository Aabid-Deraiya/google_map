import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_map/ui/registeration/login_screen.dart';
import 'package:google_map/ui/registeration/phone_otp.dart';
import 'package:google_map/ui/registeration/phone_signup.dart';
import 'package:google_map/ui/screens/home_screen.dart';
import 'package:google_map/utils/big_text.dart';
import 'package:google_map/utils/closs_app.dart';
import 'package:google_map/utils/dimension.dart';
import 'package:google_map/utils/small_text.dart';
import 'package:google_map/widget/button.dart';
import 'package:google_map/utils/toast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isVisible = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final closeApp = CloseApp();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVisible = true;
  }

  void SingUp(){
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
        email: _email.text.toString(),
        password: _password.text.toString())
        .then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          authToast(Colors.green).toastMessage("Sign up successful",);
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      print(error.toString());
      authToast(Colors.red).toastMessage(error.toString());
    });
  }

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
                child: BigText(text: "Getting Started"),
              ),
              Container(
                  margin: EdgeInsets.only(left: dimension.width20),
                  child: SmallText(text: "Create an account to continue")),
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
                        margin: EdgeInsets.symmetric(
                            horizontal: dimension.height20,
                            vertical: dimension.height20),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                          controller: _email,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: dimension.font16 * 1.2),
                          decoration: InputDecoration(
                            labelText: "Email",
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
                        margin: EdgeInsets.symmetric(
                            horizontal: dimension.height20),
                        child: TextFormField(
                          controller: _password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            }
                            return null;
                          },
                          cursorColor: Colors.black,
                          obscureText: isVisible,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: dimension.font16 * 1.2),
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: !isVisible
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off)),
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
                    if (_formKey.currentState!.validate()) {
                      SingUp();
                    }
                  },
                  text: "Sign Up",
                  height: dimension.height45 * 1.1,
                  width: dimension.screenWidth,
                ),
              ),
              SizedBox(
                height: dimension.height10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(text: "----"),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: dimension.width20,
                          vertical: dimension.height20),
                      child: Text("Or sign up with")),
                  SmallText(text: "----"),
                ],
              ),
              SizedBox(
                height: dimension.height10,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: dimension.width20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.4, color: Colors.purple),
                      borderRadius:
                          BorderRadius.circular(dimension.width10 * 1.3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: dimension.height30,
                        width: dimension.width30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/Google.png"))),
                      ),
                      Button(
                        onTap: () {},
                        text: "Continue with Google",
                        height: dimension.height45 * 1.1,
                        width: dimension.width30 * 7,
                        color: Colors.white,
                        textColor: Colors.black,
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: dimension.height10,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: dimension.width20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.4, color: Colors.purple),
                      borderRadius:
                      BorderRadius.circular(dimension.width10 * 1.3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: dimension.height30,
                        width: dimension.width30,
                        child: Icon(Icons.phone_iphone),
                      ),
                      Button(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneSignUp()));
                        },
                        text: "Continue with Phone",
                        height: dimension.height45 * 1.1,
                        width: dimension.width30 * 7,
                        color: Colors.white,
                        textColor: Colors.black,
                      ),
                    ],
                  )
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: dimension.height20),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        Button(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          text: "Sign In",
                          width: dimension.width30 * 1.7,
                          size: dimension.font13,
                          color: Colors.white,
                          textColor: Color.fromARGB(500, 110, 60, 188),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
