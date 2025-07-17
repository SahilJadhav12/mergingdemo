import 'package:flutter/material.dart';
import 'dashboard_bottom_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
    Center(child: Text('Add Page')),
    Center(child: Text('Notifications Page')),
    Center(child: Text('Profile Page')),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: _pages[selectedIndex],
      bottomNavigationBar: DashboardBottomBar(
        selectedIndex: selectedIndex,
        onItemSelected: onItemTapped,
      ),
    );
  }
} 