import 'package:flutter/material.dart';
import 'package:recipe_book/src/models/recipe_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/recipes/recipe_drawer.dart';
import '../../resources/recipe_fire_resource.dart';
import '../../widgets/ui_elements/ui_element.dart';
import '../../widgets/recipes/recipe_list_row.dart';

class BookMarkList extends StatefulWidget {
  BookMarkList({Key key}) : super(key: key);

  @override
  _BookMarkListState createState() => _BookMarkListState();
}

class _BookMarkListState extends State<BookMarkList> {
  final RecipeFireResource resource = RecipeFireResource();

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

    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Spinner();
          }
          FirebaseUser user = snapshot.data;
          
          return StreamBuilder<QuerySnapshot>(
            stream: resource.getBookMarkList(user.uid),
            builder: (context, snapshot) {
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
            }
          );
        });
  }
}
