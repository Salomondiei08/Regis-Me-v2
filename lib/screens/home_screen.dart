import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Regis Me'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        unselectedLabelStyle: TextStyle(color: Colors.green.withOpacity(0.3)),
        selectedLabelStyle: const TextStyle(color: Colors.green),
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
              Icons.add,
              color: Colors.green,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.delete,
                color: Colors.green,
              ),
              label: 'delete')
        ],
      ),
    );
  }
}
