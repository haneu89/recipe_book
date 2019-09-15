import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {

  String _initialRoute = 'recipe';

  var user = await _auth.currentUser();

  if(user == null) {
    AuthResult authResult = await _auth.signInAnonymously();
    print(authResult);
  }

  
  return runApp(MyApp(initialRoute: _initialRoute));
}
