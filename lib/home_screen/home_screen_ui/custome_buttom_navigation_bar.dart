import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home_screen/home_screen_ui/home_screen.dart';

class CustomeButtomNavigationBar extends StatefulWidget {
  @override
  State<CustomeButtomNavigationBar> createState() =>
      _CustomeButtomNavigationBarState();
}

class _CustomeButtomNavigationBarState
    extends State<CustomeButtomNavigationBar> {
  int currentIndex = 0;
  final tabs = [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        backgroundColor: Colors.black.withOpacity(0.8),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_card_outlined),
            label: 'BROWSE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_rounded),
            label: 'WATCHLIST',
          )
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        fixedColor: Color(0xffFFBB3B),
      ),
      body: tabs[currentIndex],
    );
  }
}
