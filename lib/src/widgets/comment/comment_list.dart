import 'package:flutter/material.dart';
import 'package:recipe_book/src/widgets/ui_elements/elements.dart';

class CommentList extends StatelessWidget {
  final dynamic document;
  CommentList(this.document, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Panel(
      child: ListTile(
        title: Text('${document['name']}'),
        subtitle: Text('${document['content']}'),
      ),
    );
  }
}
