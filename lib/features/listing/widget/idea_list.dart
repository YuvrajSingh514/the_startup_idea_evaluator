import 'package:flutter/material.dart';
import 'package:the_startup_idea_evaluator/shared/my_app_bar.dart';

class IdeaList extends StatelessWidget {
  const IdeaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Ideas List'),
    );
  }
}