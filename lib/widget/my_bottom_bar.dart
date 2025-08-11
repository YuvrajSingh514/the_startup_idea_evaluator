import 'package:flutter/material.dart';
import 'package:the_startup_idea_evaluator/constants/color_constant.dart';
import 'package:the_startup_idea_evaluator/features/add/widget/add_form.dart';
import 'package:the_startup_idea_evaluator/screens/leaderboard_screen.dart';
import 'package:the_startup_idea_evaluator/screens/list_screen.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _currentIndex = 0;
  final List<Widget> _screen = [
    const AddForm(),
    const ListScreen(),
    const LeaderboardScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstant.primaryColor,
        selectedItemColor: Colors.blue,
        unselectedItemColor: ColorConstant.myTextColor,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            activeIcon: Icon(Icons.list),
            label: 'Ideas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            activeIcon: Icon(Icons.leaderboard),
            label: 'LeaderBoard',
          ),
        ],
      ),
    );
  }
}
