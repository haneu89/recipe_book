import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {

  String _initialRoute = 'recipe';

  FirebaseUser user = await _auth.currentUser();
  // print(user.uid);

  if(user == null) {
    AuthResult authResult = await _auth.signInAnonymously();
    // print(authResult);
  }

  
  return runApp(MyApp(initialRoute: _initialRoute));
}
