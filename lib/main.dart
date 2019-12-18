import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String _initialRoute = 'recipe';

  if (Platform.isIOS) {
    _firebaseMessaging.requestNotificationPermissions();
  }

  FirebaseUser user = await _auth.currentUser();

  if (user == null) { // 최초 가입시
    AuthResult authResult = await _auth.signInAnonymously();

    UserUpdateInfo updateUser = UserUpdateInfo();
    updateUser.displayName = authResult.user.uid.substring(1, 6);
    await authResult.user.updateProfile(updateUser);
    // _initialRoute = 'welcome';

    // FCM Topic 구독
    _firebaseMessaging.subscribeToTopic('new');
  }

  return runApp(MyApp(initialRoute: _initialRoute));
}
