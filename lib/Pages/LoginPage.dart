import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ujilevel/Pages/HomePage.dart';
import 'package:flutter_ujilevel/Pages/Homenew.dart';
import 'package:flutter_ujilevel/Pages/LandingPage.dart';
import 'package:flutter_ujilevel/methods/api.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool passwordd = true;

  late String message = '';

 void loginUser() async {
    final data = {
      'email': email.text.toString(),
      'password': password.text.toString(),
    };
    final result = await Api().postRequest(route: '/loginapi', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setInt('user_id', response['relasi']);
      await preferences.setString('name', response['user']['name']);
      await preferences.setString('email', response['user']['email']);
      await preferences.setString('token', response['token']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['message']),
        ),
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homenew(),
     ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        // balik ke awal
                      },
                      icon: const Icon(Icons.arrow_back_rounded)),
                ),

                // Hero Image
                const SizedBox(
                  height: 15,
                ),
                
                const SizedBox(
                  height: 15,
                ),

                // Sign Up
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Input Start
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(Icons.alternate_email_rounded),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(Icons.lock_rounded),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordd = !passwordd;
                                  });
                                },
                                icon: Icon(password == false
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        obscureText: passwordd,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                // Input End

                const SizedBox(
                  height: 20,
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?',
                        style: TextStyle(color: Colors.blueAccent)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // Button Start
                Center(
                  child: InkWell(
                    onTap: () {
                      loginUser();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                        width: 320,
                        height: 50,
                        child: Text('CONTINUE'),),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Center(
                  child: message.isNotEmpty
                      ? Text(
                          message,
                          style: TextStyle(color: Colors.red),
                        )
                      : Text(''),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ))
                            },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                ),
              ],
            ),
          ],
        ),
        // icon
      ),
      backgroundColor: Colors.white,
    );
  }
}
