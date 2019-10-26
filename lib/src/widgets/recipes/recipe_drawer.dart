import 'package:flutter/material.dart';
import 'package:path/path.dart';

class RecipeDrawer extends StatelessWidget {
  const RecipeDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: SafeArea(
          child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.bookmark_border),
            title: Text('메인화면'),
            onTap: () {
              _moveRoute(context, 'recipe');
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark_border),
            title: Text('즐겨찾기 보기'),
            onTap: () {
              _moveRoute(context, 'bookmark');
              
            },
          ),
        ],
      )),
    );

  }
  void _moveRoute(context, String targetRoute) {
      String currentRoute = ModalRoute.of(context).settings.name;
      (currentRoute == targetRoute) ? Navigator.pop(context) : Navigator.pushReplacementNamed(context, targetRoute);
    }
}
