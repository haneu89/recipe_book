import 'package:flutter/material.dart';

class RecipeShow extends StatelessWidget {
  String recipeId;

  RecipeShow(this.recipeId);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$recipeId 레시피 '),
      ),
      body: Center(
        child: Text('$recipeId 를 요리해보세요'),
      ),
    );
  }
}
