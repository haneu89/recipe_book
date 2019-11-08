import 'package:flutter/material.dart';
import '../../models/recipe_model.dart';

class RecipeListRow extends StatelessWidget {
  final RecipeModel _recipe;

  RecipeListRow(this._recipe);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, 'recipe/${_recipe.id}');
      },
      title: Text(_recipe.title),
      leading: SizedBox(
        width: 70,
        height: 100,
        child: Image.network(_recipe.image, fit: BoxFit.cover),
      ),
    );
  }
}
