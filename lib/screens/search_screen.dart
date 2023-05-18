import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Text(
            'Search',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10,),
          Icon(Icons.search)
        ],
      ),
    );
  }
}
