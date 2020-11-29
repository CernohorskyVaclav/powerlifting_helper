import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:powerlifting_helper/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SignIn(),
    );
  }
}
