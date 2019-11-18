import 'package:flutter/material.dart';

class ImgPic {

  Function useCamera;
  Function useGallery;

  ImgPic.bottomImagePicker(BuildContext context, { this.useCamera, this.useGallery }) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text(
                '이미지를 불러올 곳을 고르세요',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('카메라'),
                onPressed: useCamera,
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('갤러리'),
                onPressed: useGallery,
              )
            ]),
          );
        });
  }
}