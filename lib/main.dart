import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_startup_idea_evaluator/features/add/bloc/add_bloc.dart';
import 'package:the_startup_idea_evaluator/features/bottomBar/bloc/bottom_bar_bloc.dart';
import 'package:the_startup_idea_evaluator/features/bottomBar/widget/my_bottom_bar.dart';
import 'package:the_startup_idea_evaluator/features/ideas%20list/bloc/ideas_list_bloc.dart';
import 'package:the_startup_idea_evaluator/features/leaderboard/bloc/leaderboard_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomBarBloc>(create: (context) => BottomBarBloc()),
        BlocProvider<IdeasListBloc>(create: (context) => IdeasListBloc()),
        BlocProvider<AddBloc>(create: (context)=> AddBloc()),
        BlocProvider<LeaderboardBloc>(create: (context)=> LeaderboardBloc()),
      ],

      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MyBottomBar(),
          );
        },
      ),
    );
  }
}
