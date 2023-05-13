import 'package:flutter/material.dart';
import 'package:regis_me/screens/splash_screen.dart';


void main() {
  runApp( const RegisMe());
}


class RegisMe extends StatelessWidget {
  const RegisMe({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Regis Me',
      home: SplashScreen(),
    );
  }
}