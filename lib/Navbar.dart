import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mindease_app/Menus/Breathe.dart';
import 'package:mindease_app/Menus/Home.dart';
import 'package:mindease_app/Menus/Journal.dart';
import 'package:mindease_app/Menus/Profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    // Add your page widgets here
    Home(),
    Breathe(),
    Journal(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              onTabChange: _navigateBottomBar,
              selectedIndex: _selectedIndex,
              tabBackgroundColor: Color(0xFF98C9C8),
              activeColor: Colors.white,
              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.self_improvement_rounded, text: 'Breathe'),
                GButton(icon: Icons.book, text: 'Journal'),
                GButton(icon: Icons.person, text: 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
