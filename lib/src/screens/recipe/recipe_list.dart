import 'package:flutter/material.dart';
import 'package:recipe_book/src/models/recipe_model.dart';
import '../../widgets/recipes/recipe_list_card.dart';
import '../../resources/recipe_fire_resource.dart';
import '../../widgets/recipes/recipe_drawer.dart';

class RecipeList extends StatelessWidget {
  final RecipeFireResource resource = RecipeFireResource();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    // final double itemHeight = 205;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth / 18 * 11 + 95;

    return Scaffold(
      drawer: RecipeDrawer(),
      appBar: AppBar(
        title: Text('레시피 앱'),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
            stream: resource.getItemList,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  RecipeModel recipe = RecipeModel.fromSnapshot(document);
                  return RecipeListCard(recipe);
                }).toList(),
              );
            }),
      ),
    );
  }
}
