import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:recipe_book/src/widgets/ui_elements/elements.dart';
import 'package:recipe_book/src/widgets/ui_elements/info_box.dart';

class RecipeDetail extends StatelessWidget {
  final dynamic snapshot;
  RecipeDetail(this.snapshot, {Key key}) : super(key: key);

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
                  snapshot.data['title'],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  snapshot.data['subtitle'],
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
            height: 15,
          ),
          Panel(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InfoBar(
                  subject: '조리 시간',
                  text: "${snapshot.data['cookingtime']}",
                ),
                InfoBar(
                  subject: '의견 수',
                ),
                InfoBar(
                  subject: '즐겨찾기 수',
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
            data: snapshot.data['content'],
          )),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
