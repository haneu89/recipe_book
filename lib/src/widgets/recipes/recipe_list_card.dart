import 'package:flutter/material.dart';

class RecipeListCard extends StatelessWidget {
  int index;

  RecipeListCard(this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GridTile(
        child: Image.network(
          "http://admin.brainworld.com/Library/FileDown.aspx?filename=5p(6).jpg&filepath=Opinion",
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black.withOpacity(0.64),
          title: Text(
            "레시피 번호 : $index",
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
