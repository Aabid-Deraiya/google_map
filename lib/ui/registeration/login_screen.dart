import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_map/ui/registeration/forgot_password/forgot_password.dart';
import 'package:google_map/ui/registeration/google_signin.dart';
import 'package:google_map/ui/registeration/phone_signup.dart';
import 'package:google_map/ui/registeration/signup_screen.dart';
import 'package:google_map/ui/screens/home_screen.dart';
import 'package:google_map/utils/big_text.dart';
import 'package:google_map/utils/dimension.dart';
import 'package:google_map/utils/small_text.dart';
import 'package:google_map/utils/toast.dart';
import 'package:google_map/widget/button.dart';

import '../../utils/closs_app.dart';
import 'login_using_phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isVisible = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final closeApp = CloseApp();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVisible = true;
  }

  void Login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: _email.text.toString(), password: _password.text.toString())
        .then((value) {
          authToast(Colors.green).toastMessage("login successful");
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
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
                    top: dimension.height45 * 1.4, left: dimension.width20),
                child: BigText(text: "Welcome Back"),
              ),
              Container(
                  margin: EdgeInsets.only(left: dimension.width20),
                  child: SmallText(text: "Sign in your account")),
              SizedBox(
                height: dimension.height45,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: dimension.height20,
                            vertical: dimension.height20),
                        child: TextFormField(
                          controller: _email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Name";
                            }
                            return null;
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: dimension.font16 * 1.2),
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
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
                          cursorColor: Colors.black,
                          controller: _password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            }
                            return null;
                          },
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
                            prefixIcon: Icon(Icons.lock),
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
              Container(
                  margin: EdgeInsets.symmetric(
                      vertical: dimension.height10,
                      horizontal: dimension.width20),
                  alignment: Alignment.centerRight,
                  child: Button(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    text: "Forgot Password?",
                    size: dimension.font13,
                    color: Colors.white,
                    height: dimension.height20,
                    textColor: Colors.grey,
                    width: dimension.width30 * 3,
                  )),
              SizedBox(
                height: dimension.height30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: dimension.width20),
                child: Button(
                  loading: loading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Login();
                    }
                  },
                  text: "Sign In",
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
                      child: Text("Or sign in with")),
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
                  child: InkWell(
                    onTap: (){

                    },
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
                          onTap: () {
                            googleLogin(context);
                            print("done");
                          },
                          text: "Continue with Google",
                          height: dimension.height45 * 1.1,
                          width: dimension.width30 * 7,
                          color: Colors.white,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: dimension.width20, vertical: dimension.height20),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneLogin()));
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
              SizedBox(
                height: dimension.height10,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: dimension.height20),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        Button(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                          text: "Sign Up",
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
