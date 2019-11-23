import 'package:flutter/material.dart';

class Panel extends StatelessWidget {

  Widget child;

  Panel({this.child});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35,),
      color: Colors.white,
      child: child
    );
  }
}
