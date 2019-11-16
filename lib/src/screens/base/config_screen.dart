import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({Key key}) : super(key: key);

  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  bool _allowNotiNew = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('새글 알림'),
            trailing: Switch(onChanged: _toggleNotiNew, value: _allowNotiNew,),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('개인정보 처리방침'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('이용 약관'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('버전 정보'),
            onTap: () {},
          ),
        ],
      )),
    );
  }
  _toggleNotiNew(bool newValue) {
    (newValue) ? _firebaseMessaging.subscribeToTopic('new') : _firebaseMessaging.unsubscribeFromTopic('new');
    setState(() => _allowNotiNew = newValue);
  }
}
