import 'package:flutter/material.dart';

class Panel extends StatelessWidget {

  Widget child;

  Panel({this.child});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      child: child
    );
  }
}
