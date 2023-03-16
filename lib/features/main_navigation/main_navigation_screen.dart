import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.lightGreen.shade100,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: Colors.lightGreen.shade300,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTap,
        destinations: [
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: _selectedIndex == 0 ? Colors.teal.shade800 : Colors.teal,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: _selectedIndex == 1 ? Colors.teal.shade800 : Colors.teal,
            ),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
