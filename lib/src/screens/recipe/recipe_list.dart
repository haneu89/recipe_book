import 'package:flutter/material.dart';
import '../../widgets/recipes/recipe_list_card.dart';

class RecipeList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemHeight = 205;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('레시피 앱'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          children: List.generate(100, (index) {
            return RecipeListCard(index);
          }),
        ),
      ),
    );
  }
}
