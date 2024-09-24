import 'package:flutter/material.dart';
import '../../Browse_screen/browse.dart';
import '../../search_screen/search.dart';
import 'home_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget{
  static const String routeName = 'CustomBottomNavigationBar';
  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  static List<Widget> screens = <Widget>[
    HomeScreen(),
    SearchScreen(),
    Browse(),
    Center(child: Text('Watchlist Screen', style: TextStyle(fontSize: 12))),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],  // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,  // To maintain text alongside icons
        backgroundColor: Colors.black.withOpacity(0.8),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Watchlist',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: onItemTapped,
      ),
    );
  }
  }