import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import '../../widgets/ui_elements/ui_element.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController _textFieldController = TextEditingController();
  final String fileName = Random().nextInt(10000).toString();

  Future getImage(context, source) async {
    File image = await ImagePicker.pickImage(source: source);
    FirebaseUser curUser = await FirebaseAuth.instance.currentUser();
    UserUpdateInfo updateUser = UserUpdateInfo();
    updateUser.photoUrl = await uploadImage(image);
    await curUser.updateProfile(updateUser);

    Navigator.pop(context);
  }

  Future<String> uploadImage(File image) async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child('test/${fileName}_${basename(image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;    
    return storageReference.getDownloadURL().then((fileURL) {
     return fileURL;
   });
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text(
                'Pick an Image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Use Camera'),
                onPressed: () {
                  getImage(context, ImageSource.camera);
                },
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Use Gallery'),
                onPressed: () {
                  getImage(context, ImageSource.gallery);
                },
              )
            ]),
          );
        });
  }


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
            String photoUrl = (user.photoUrl) ?? '//placehold.it/32x32';

            return ListView(
              children: <Widget>[
                Container(
                  height: 180,
                  color: Theme.of(context).accentColor,
                  alignment: Alignment(0, 0),
                  child: InkWell(
                    onTap: () { _openImagePicker(context); },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(photoUrl),
                      backgroundColor: Colors.white,
                    ),
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
                              Text(
                                '이름',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                user.displayName ?? '',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _displayDialog(context);
                            },
                          )),
                    ],
                  ),
                )
              ],
            );
          }),
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
                  FirebaseUser curUser =
                      await FirebaseAuth.instance.currentUser();

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
