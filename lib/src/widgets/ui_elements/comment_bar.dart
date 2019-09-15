import 'package:flutter/material.dart';

class CommentBar extends StatelessWidget {
  final _commentContentController;
  final Function _onPressed;

  CommentBar(this._onPressed, this._commentContentController);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border(top: BorderSide(color: Colors.black, width:0.5))),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_enhance),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _commentContentController,
              decoration: InputDecoration(
                  fillColor: Colors.white, hintText: "comment area"),
            ),
          ),
          RaisedButton(
            child: Text('asdf'),
            onPressed: _onPressed,
          )
        ],
      ),
    );
  }
}
