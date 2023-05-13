import 'dart:async';

import 'package:flutter/material.dart';
import 'package:regis_me/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
void initState() {
super.initState();

Timer(const Duration(seconds: 4), () {
  setState(() {
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (ctx) => const HomeScreen()));
  });
 });
}






  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('https://blog.hootsuite.com/wp-content/uploads/2020/02/Image-copyright.png.webp'),
      ),
    );
  }
}