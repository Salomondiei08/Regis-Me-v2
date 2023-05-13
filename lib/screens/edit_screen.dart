import 'package:flutter/material.dart';


class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: const [
           Text(
            'Edit Screen',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Icon(Icons.edit)
        ],
      ),
    );
  }
}