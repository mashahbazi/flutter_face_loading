import 'package:flutter/material.dart';
import 'package:flutter_face_loading/face_loading/face_loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Face Loading',
      home: FaceLoadingScreen(),
    );
  }
}
