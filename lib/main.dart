import 'package:flutter/material.dart';
import 'package:fyp_booking/Login/Login.dart';
import 'package:fyp_booking/Splash/splash.dart';

import 'HomePage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Splash(),
    );
  }
}
