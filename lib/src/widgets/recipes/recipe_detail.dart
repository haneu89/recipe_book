import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:recipe_book/src/models/recipe_model.dart';
import 'package:recipe_book/src/widgets/ui_elements/elements.dart';
import 'package:recipe_book/src/widgets/ui_elements/info_box.dart';

class RecipeDetail extends StatelessWidget {
  final RecipeModel recipe;
  RecipeDetail(this.recipe, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Panel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  recipe.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  recipe.subtitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color.fromRGBO(216, 216, 216, 1)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Panel(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InfoBar(
                  subject: '조리 시간',
                  text: "${recipe.percent}",
                ),
                InfoBar(
                  subject: '의견 수',
                  text: "${recipe.commentCount}",
                ),
                InfoBar(
                  subject: '즐겨찾기 수',
                  text: "${recipe.favoriteCount}",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Panel(
            child: Text(
              '상세 조리법',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Panel(
              child: Html(
            data: recipe.content,
          )),
          SizedBox(
            height: 30,
          ),
          Panel(
            child: Text(
              '댓글',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
