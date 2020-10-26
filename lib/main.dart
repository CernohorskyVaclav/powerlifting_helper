import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:powerlifting_helper/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // TODO: implement build
    return MaterialApp(
      title: 'Power Helper',
      home: Nav(),
    );
  }
}
