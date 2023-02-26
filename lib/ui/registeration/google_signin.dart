import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_map/utils/toast.dart';

import '../screens/home_screen.dart';

googleLogin(BuildContext context) async {
  print("Login method called");
  GoogleSignIn _googleSignIn = GoogleSignIn();
  try {
    var result = await _googleSignIn.signIn();
    if (result == null) {
      return;
    }
    final userData = await result.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: userData.accessToken, idToken: userData.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    authToast(Colors.green).toastMessage("Login Successful");
  } catch (error) {
    print(error);
  }
}

Future<void> logout() async {
  await GoogleSignIn().disconnect();
  FirebaseAuth.instance.signOut();
  print("Logout called");
}
