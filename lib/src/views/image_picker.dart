import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHome extends StatefulWidget {
  @override
  _ImagePickerHomeState createState() => _ImagePickerHomeState();
}

class _ImagePickerHomeState extends State<ImagePickerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Center(
        child: getImageWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showOptions(context);
        },
      ),
    );
  }

  Widget getImageWidget() {
    if (_image == null) {
      return Text("Seleccione una imagen");
    } else {
      return Image.file(_image);
    }
  }

  File _image;

  void getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);

    setState(() {
      _image = image;
    });
  }

  void _showOptions(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("camera"),
                onTap: () {
                  Navigator.pop(context);
                  getImage(ImageSource.camera);
                },
              ),
              ListTile(
                title: Text("Galeria"),
                leading: Icon(Icons.image),
                onTap: () {
                  Navigator.pop(context);
                  getImage(ImageSource.gallery);
                },
              )
            ],
          );
        });
  }
}
