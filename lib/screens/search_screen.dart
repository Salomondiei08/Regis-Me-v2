import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: const [
          Text(
            'Search Screen',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Icon(Icons.search)
        ],
      ),
    );
  }
}
