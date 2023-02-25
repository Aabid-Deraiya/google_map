import 'package:flutter/material.dart';
import 'package:google_map/firebase_services/splash_services.dart';
import 'package:google_map/utils/dimension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices=SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Center(
        child: Container(
          height: dimension.screenHeight,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(image: AssetImage("assets/Logo.png"))
          ),
        ),
      ),
    );
  }
}
