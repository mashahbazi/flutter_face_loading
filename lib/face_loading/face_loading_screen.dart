import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_face_loading/face_loading/face_loading_widget.dart';

class FaceLoadingScreen extends StatefulWidget {
  @override
  _FaceLoadingScreenState createState() => _FaceLoadingScreenState();
}

class _FaceLoadingScreenState extends State<FaceLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FaceLoadingWidget(40, 2000),
    );
  }
}
