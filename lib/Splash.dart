import 'package:flutter/material.dart';
import 'package:flutter_ujilevel/Pages/LoginPage.dart';
import 'package:lottie/lottie.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.asset(
            //   "lottie/plane.json",
            //   width: 400,
            // ),
            LoadingAnimationWidget.inkDrop(color: Colors.blue, size: 40)
          ],
        ),
      ),
    );
  }
}