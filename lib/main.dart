import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void main() async {

  String _initialRoute = 'recipe';

  // iOS 용
  _firebaseMessaging.requestNotificationPermissions();

  FirebaseUser user = await _auth.currentUser();
  // print(user.uid);

  if(user == null) {
    AuthResult authResult = await _auth.signInAnonymously();
    // print(authResult);
  }

  
  return runApp(MyApp(initialRoute: _initialRoute));
}
