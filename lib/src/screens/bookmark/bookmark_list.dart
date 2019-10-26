import 'package:flutter/material.dart';
import '../../widgets/recipes/recipe_drawer.dart';

class BookMarkList extends StatefulWidget {
  BookMarkList({Key key}) : super(key: key);

  @override
  _BookMarkListState createState() => _BookMarkListState();
}

class _BookMarkListState extends State<BookMarkList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: RecipeDrawer(),
        appBar: AppBar(
          title: Text('즐겨찾기'),
        ),
        body: Text('list'),
      ),
    );
  }
}
