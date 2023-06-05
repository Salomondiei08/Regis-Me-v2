import 'package:flutter/material.dart';

import '../widgets/search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [IconButton(onPressed: () => showSearch(context: context, delegate: Search()), icon: Icon(Icons.search))],
      ),
    );
  }
}
