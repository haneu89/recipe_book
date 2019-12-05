import 'package:flutter/material.dart';
import 'package:recipe_book/src/widgets/ui_elements/elements.dart';

class CommentList extends StatelessWidget {
  final dynamic document;
  CommentList(this.document, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Panel(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    document['profile'] ?? 'https://placehold.it/32x32'),
                backgroundColor: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${document['name']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        // color: Color.fromRGBO(216, 216, 216, 1)
                      ),
                    ),
                    Text('${document['content']}'),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
