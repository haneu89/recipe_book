import 'package:flutter/material.dart';

class RecipeListCard extends StatelessWidget {
  int index;

  RecipeListCard(this.index);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('Card tapped.');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.network(
                "https://assets3.thrillist.com/v1/image/2797371/size/tmg-article_default_mobile.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Title'),
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
                      Text("8", style: TextStyle(color: Colors.black),),
                      SizedBox(width: 5,),
                      Icon(Icons.favorite_border, color: Colors.black, size: 12,),
                      SizedBox(width: 5,),
                      Text("8", style: TextStyle(color: Colors.black),),
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
