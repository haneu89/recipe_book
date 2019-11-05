import 'package:flutter/material.dart';
import 'package:recipe_book/src/models/recipe_model.dart';

class RecipeListCard extends StatelessWidget {
  final RecipeModel snapshot;

  RecipeListCard(this.snapshot);
  
  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(context, 'recipe/${snapshot.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.network(
                snapshot.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(snapshot.title),
                  SizedBox(height: 8.0),
                  Text('Secondary Text'),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.timer, color: Colors.black, size: 12,),
                      SizedBox(width: 5,),
                      Text("30", style: TextStyle(color: Colors.black),),
                      SizedBox(width: 5,),
                      Icon(Icons.comment, color: Colors.black, size: 12,),
                      SizedBox(width: 5,),
                      Text("${snapshot.commentCount}", style: TextStyle(color: Colors.black),),
                      SizedBox(width: 5,),
                      Icon(Icons.bookmark_border, color: Colors.black, size: 12,),
                      SizedBox(width: 5,),
                      Text("${snapshot.favoriteCount}", style: TextStyle(color: Colors.black),),
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
