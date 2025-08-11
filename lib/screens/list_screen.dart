import 'package:flutter/material.dart';
import 'package:the_startup_idea_evaluator/features/ideas%20list/widget/startup_list.dart';
import 'package:the_startup_idea_evaluator/shared/my_app_bar.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Startup Ideas'),
      body: StartupList(),
    );
  }
}