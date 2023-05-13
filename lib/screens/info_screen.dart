import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:  Column(
        children: const [
          Text(
            'Info Screen',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Icon(Icons.home)
        ],
      ),
    );
  }
}
