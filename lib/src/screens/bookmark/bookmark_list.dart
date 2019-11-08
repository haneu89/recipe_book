import 'package:flutter/material.dart';
import 'package:recipe_book/src/models/recipe_model.dart';
import '../../widgets/recipes/recipe_drawer.dart';
import '../../resources/recipe_fire_resource.dart';
import '../../widgets/ui_elements/ui_element.dart';
import '../../widgets/recipes/recipe_list_row.dart';

import 'package:firebase_auth/firebase_auth.dart';

class BookMarkList extends StatefulWidget {
  BookMarkList({Key key}) : super(key: key);

  @override
  _BookMarkListState createState() => _BookMarkListState();
}

class _BookMarkListState extends State<BookMarkList> {
  final RecipeFireResource resource = RecipeFireResource();
  String uid;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  _getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      uid = user.uid;
      print(uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          drawer: RecipeDrawer(),
          appBar: AppBar(
            title: Text('즐겨찾기'),
          ),
          body: _buildListView()),
    );
  }

  _buildListView() {

    return StreamBuilder<QuerySnapshot>(
        stream: resource.getBookMarkList(uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Spinner();
          }
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot document = snapshot.data.documents[index];
              RecipeModel recipe = RecipeModel.fromSnapshot(document);
              return RecipeListRow(recipe);
            },
          );
        });
  }
}
