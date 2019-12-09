import 'package:flutter/material.dart';
import 'package:recipe_book/src/models/recipe_model.dart';

class RecipeListCard extends StatelessWidget {
  final RecipeModel _recipe;

  RecipeListCard(this._recipe);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(context, 'recipe/${_recipe.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Hero(
                tag: _recipe.id,
                child: 
                FadeInImage.assetNetwork(
                  placeholder: 'assets/splash.jpg',
                  image: _recipe.image,
                  fit: BoxFit.fitWidth,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_recipe.title),
                  SizedBox(height: 8.0),
                  Text('${_recipe.subtitle}'),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.local_bar,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${_recipe.percent}",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${_recipe.commentCount}",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.bookmark_border,
                        color: Colors.black,
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${_recipe.favoriteCount}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
