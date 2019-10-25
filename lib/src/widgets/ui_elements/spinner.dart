import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  const Spinner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
