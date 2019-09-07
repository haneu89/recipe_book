import 'package:flutter/material.dart';
import '../../widgets/recipes/recipe_list_card.dart';

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('레시피 앱'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return RecipeListCard(index);
          }),
        ),
      ),
    );
  }
}
