import 'package:flutter/material.dart';
import '../../widgets/ui_elements/elements.dart';

class RecipeShow extends StatelessWidget {
  String recipeId;

  RecipeShow(this.recipeId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$recipeId 레시피 '),
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'this is title Area',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.network(
                "https://assets3.thrillist.com/v1/image/2797371/size/tmg-article_default_mobile.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
            Panel(
              child: Text('asdf'),
            ),
          ],
        ),
      ),
    );
  }
}
