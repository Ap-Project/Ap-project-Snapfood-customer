import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  File _image;
  final picker = ImagePicker();

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null)
        _image = File(pickedFile.path);
      else
        print('no image selected');
    });
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null)
        _image = File(pickedFile.path);
      else
        print('no image selected');
    });
  }

  void removePhoto() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 250.0,
      margin: EdgeInsets.only(left: 30.0, top: 25.0),
      child: Column(
        children: <Widget>[
          Text(
            "Profile photo",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.orange
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0, top: 20.0),
            child: Row(
              children: <Widget>[
                FlatButton.icon(
                  icon:
                  _image == null ? Icon(Icons.camera) : Image.file(_image),
                  onPressed: getImageCamera, //camera
                  label: Text("Camera"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                ),
                FlatButton.icon(
                  icon: _image == null
                      ? Icon(Icons.image_outlined)
                      : Image.file(_image),
                  onPressed: getImageGallery,
                  label: Text("Gallery"),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 40.0, top: 10.0),
            child: Row(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.delete),
                  onPressed: removePhoto,
                  label: Text("Remove"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
