import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Text(
            'Account',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10,),
          Icon(Icons.people)
        ],
      ),
    );
  }
}
