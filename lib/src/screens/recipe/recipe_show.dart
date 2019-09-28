import 'package:flutter/material.dart';
import '../../widgets/ui_elements/elements.dart';

import '../../widgets/ui_elements/comment_bar.dart';
import '../../resources/recipe_fire_resource.dart';

class RecipeShow extends StatelessWidget {
  RecipeFireResource resource = RecipeFireResource();

  final _commentContentController = TextEditingController();
  String recipeId;

  RecipeShow(this.recipeId);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: resource.getItemOne(recipeId),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('${snapshot.data['title']}'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: _recipeDetail(snapshot),
                ),
                CommentBar(() {}, _commentContentController),
              ],
            ),
          );
        });
  }

  Widget _recipeDetail(snapshot) {
    return Container(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18 / 11,
            child: Image.network(
              snapshot.data['image'],
              fit: BoxFit.fitWidth,
            ),
          ),
          Panel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data['title'],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  'sub title',
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
          Panel(
              child: Text(
            'sub title',
            textAlign: TextAlign.start,
          )),
        ],
      ),
    );
  }
}
