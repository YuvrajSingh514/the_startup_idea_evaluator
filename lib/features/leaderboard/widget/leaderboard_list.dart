import 'package:flutter/material.dart';
import 'package:the_startup_idea_evaluator/shared/my_app_bar.dart';

class LeaderboardList extends StatelessWidget {
  const LeaderboardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'LeaderBoard'),
    );
  }
}