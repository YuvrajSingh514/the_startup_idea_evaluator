import 'package:flutter/material.dart';
import 'package:the_startup_idea_evaluator/features/leaderboard/widget/leaderboard_list.dart';
import 'package:the_startup_idea_evaluator/shared/my_app_bar.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Leaderboard'),
      body: LeaderboardList(),
    );
  }
}