import 'package:flutter/material.dart';
import 'package:the_startup_idea_evaluator/features/add/widget/add_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddForm(),
    );
  }
}
