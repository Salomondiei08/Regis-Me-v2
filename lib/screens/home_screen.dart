import 'package:flutter/material.dart';
import 'package:regis_me/screens/edit_screen.dart';
import 'package:regis_me/screens/people_screen.dart';
import 'package:regis_me/screens/search_screen.dart';

import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentIndex = 0;
List<Widget> _pageList = const [
  InfoScreen(),
  SearchScreen(),
  EditScreen(),
  AccountScreen()
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Regis Me'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Center(child: _pageList[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.green,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.green,
              ),
              label: 'search'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.edit,
              color: Colors.green,
            ),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.green,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
