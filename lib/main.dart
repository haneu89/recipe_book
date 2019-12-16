import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void main() async {
  // iOS 오류때문에 추가
  WidgetsFlutterBinding.ensureInitialized();

  String _initialRoute = 'recipe';

  // iOS 용
  _firebaseMessaging.requestNotificationPermissions();

  FirebaseUser user = await _auth.currentUser();
  // print(user.uid);

  if(user == null) {
    // 최초 가입시
    AuthResult authResult = await _auth.signInAnonymously();

    UserUpdateInfo updateUser = UserUpdateInfo();
    updateUser.displayName = authResult.user.uid.substring(1, 6);
    await authResult.user.updateProfile(updateUser);

    _firebaseMessaging.subscribeToTopic('new');
  }

  
  return runApp(MyApp(initialRoute: _initialRoute));
}
