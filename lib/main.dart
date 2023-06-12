import 'package:flutter/material.dart';
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
      home: const Splash(),
    );
  }
}