import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/ui_elements/ui_element.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원 정보'),
      ),
      body: StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (builderContext, snapshot) {
          if (!snapshot.hasData) {
            return Spinner();
          }
          FirebaseUser user = snapshot.data;

          return ListView(
            children: <Widget>[
              Container(
                height: 180,
                color: Theme.of(context).accentColor,
                alignment: Alignment(0, 0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Text('JH'),
                ),
              ),
              Container(
                height: 8,
                color: Theme.of(context).backgroundColor,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('이름', style: TextStyle(fontSize: 12),),
                          SizedBox(height: 5,),
                          Text((user.displayName == '') ? '이름없음' : user.displayName , style: TextStyle(fontSize: 18),),
                        ],
                      ),
                      trailing: IconButton(icon:Icon(Icons.edit), onPressed: () {
                        _displayDialog(context);
                      },) 
                    ),
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('이름 변경'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "이름을 입력 해 주세요"),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () async {
                  FirebaseUser curUser = await FirebaseAuth.instance.currentUser();
                  
                  UserUpdateInfo updateUser = UserUpdateInfo();
                  updateUser.displayName = _textFieldController.text;
                  await curUser.updateProfile(updateUser);

                  _textFieldController.text = '';
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
