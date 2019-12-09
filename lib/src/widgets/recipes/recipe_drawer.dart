import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/ui_elements/ui_element.dart';

class RecipeDrawer extends StatelessWidget {
  const RecipeDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          StreamBuilder<FirebaseUser>(
              stream: FirebaseAuth.instance.onAuthStateChanged,
              builder: (builderContext, snapshot) {
                if (!snapshot.hasData) {
                  return Spinner();
                }
                FirebaseUser user = snapshot.data;

                return UserAccountsDrawerHeader(
                  accountEmail: Text(user.email ?? ''),
                  accountName: Text(user.displayName ?? ''),
                  currentAccountPicture: Hero(
                    tag: user.uid,
                    child: CircleAvatar(
                        backgroundImage: (user.photoUrl != null)
                            ? NetworkImage(user.photoUrl)
                            : AssetImage('assets/placeholder.jpg')),
                  ),
                );
              }),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('메인화면'),
            onTap: () {
              _moveRoute(context, 'recipe');
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('즐겨찾기 보기'),
            onTap: () {
              _moveRoute(context, 'bookmark');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('회원정보 수정'),
            onTap: () {
              Navigator.pushNamed(context, 'user');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('설정'),
            onTap: () {
              Navigator.pushNamed(context, 'config');
            },
          ),
        ],
      ),
    );
  }

  /**
   * 라우트 체크
   * 이동하려는 라우트가 현제 라우트와 동일하면 Drawer를 닫아주고
   * 상이하면 라우트 이동
   */
  void _moveRoute(context, String targetRoute) {
    String currentRoute = ModalRoute.of(context).settings.name;
    (currentRoute == targetRoute)
        ? Navigator.pop(context)
        : Navigator.pushReplacementNamed(context, targetRoute);
  }
}
