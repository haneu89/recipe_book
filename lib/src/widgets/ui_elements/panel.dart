import 'package:flutter/material.dart';

class Panel extends StatelessWidget {

  Widget child;
  EdgeInsetsGeometry padding;

  Panel({this.child, this.padding});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (padding == null) ? EdgeInsets.symmetric(horizontal: 35,) : padding,
      color: Colors.white,
      child: child
    );
  }
}
