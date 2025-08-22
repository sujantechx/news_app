import 'package:flutter/material.dart';
import 'package:news_app/Ui%20Screen/explore.dart';
import 'package:news_app/Ui%20Screen/home.dart';
import 'package:news_app/Ui%20Screen/profile.dart';
import 'package:news_app/Ui%20Screen/save.dart';

class DashBord extends StatefulWidget {
  const DashBord({super.key});

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  int selectedNavIndex = 0; // ✅ Keep track of selected tab

  final List<Widget> mNavPages = [
    Home(),
    Explore(),
    Saved(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mNavPages[selectedNavIndex], // ✅ Show selected screen here
      bottomNavigationBar: BottomNavigationBar(
        elevation: 11,
        iconSize: 26,
        currentIndex: selectedNavIndex, // ✅ Set the current index
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed, // ✅ For more than 3 items

        onTap: (index) {
          setState(() {
            selectedNavIndex = index; // ✅ Update index on tap
          });
        },

        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            label: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.explore),
            label: "Explore",
            icon: Icon(Icons.explore_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
