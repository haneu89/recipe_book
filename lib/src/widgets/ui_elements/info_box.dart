import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  String subject, text;

  InfoBar({
    Key key,
    this.subject = '',
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: size.width / 4.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: 1,
          color: Color.fromRGBO(224, 224, 224, 1),
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            subject,
            style: TextStyle(
                fontSize: 14.0, color: Color.fromRGBO(216, 216, 216, 1)),
          ),
          SizedBox(height: 10,),
          Text(text,
          style: TextStyle(
                fontSize: 14.0,),),
        ],
      ),
    );
  }
}
