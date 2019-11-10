import 'package:flutter/material.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({Key key}) : super(key: key);

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
            trailing: Switch(onChanged: (bool newValue) {}, value: true,),
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
}
