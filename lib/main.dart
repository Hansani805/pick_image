import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File ? _image;
  final imagePicker = ImagePicker();

  Future getImage() async{
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null ? Text("No image Selected"): Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: getImage ,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}





