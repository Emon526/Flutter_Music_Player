import 'dart:async';
import 'package:flutter/material.dart';
import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(
          milliseconds: 2000,
        ), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo/logo.png',
          width: size.width * 0.5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
