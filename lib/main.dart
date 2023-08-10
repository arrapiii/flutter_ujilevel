import 'package:flutter/material.dart';
import 'package:flutter_ujilevel/Pages/HomePage.dart';
import 'package:flutter_ujilevel/Pages/Homenew.dart';
import 'package:flutter_ujilevel/Pages/LoginPage.dart';
import 'package:flutter_ujilevel/Pages/ProfilePage.dart';
import 'package:flutter_ujilevel/Pages/LandingPage.dart';
import 'package:flutter_ujilevel/Splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppin",
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
