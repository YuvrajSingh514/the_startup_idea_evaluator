import 'package:flutter/material.dart';
import 'package:the_startup_idea_evaluator/features/add/widget/add_form.dart';
import 'package:the_startup_idea_evaluator/shared/my_app_bar.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Add Your Idea'),
      body: AddForm(),
    );
  }
}