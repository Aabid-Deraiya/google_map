import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_map/ui/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Google_Map());
}



class Google_Map extends StatelessWidget {
  const Google_Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, Widget? child){
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
            child: child!);
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
