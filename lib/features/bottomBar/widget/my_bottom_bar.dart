import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_startup_idea_evaluator/constants/color_constant.dart';
import 'package:the_startup_idea_evaluator/features/bottomBar/bloc/bottom_bar_bloc.dart';
import 'package:the_startup_idea_evaluator/screens/add_screen.dart';
import 'package:the_startup_idea_evaluator/screens/leaderboard_screen.dart';
import 'package:the_startup_idea_evaluator/screens/list_screen.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  final List<Widget> _screen = [
    const AddScreen(),
    const ListScreen(),
    const LeaderboardScreen(),
  ];

  late BottomBarBloc barBloc;

  @override
  void initState() {
    barBloc = BlocProvider.of<BottomBarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: barBloc,
      builder: (context, state) {
        return Scaffold(
          body: _screen[barBloc.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorConstant.primaryColor,
            selectedItemColor: Colors.blue,
            unselectedItemColor: ColorConstant.myTextColor,
            currentIndex: barBloc.selectedIndex,
            onTap: (index) {
              barBloc.add(ChangeBottomBarIndex(index: index));
            },
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
      },
    );
  }
}
