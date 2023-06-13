import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences preferences;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  bool isLoading = false;
  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [Text('welcome, '),
            Text(preferences.getString('name').toString()),
            SizedBox(width: 20,),
            Text(preferences.getString('email').toString())],
        ),
      ),
    );
  }
}
