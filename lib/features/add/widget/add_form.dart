import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_startup_idea_evaluator/constants/color_constant.dart';
import 'package:the_startup_idea_evaluator/features/add/bloc/add_bloc.dart';
import 'package:the_startup_idea_evaluator/screens/list_screen.dart';
import 'package:the_startup_idea_evaluator/service/add_startup_model.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final taglineController = TextEditingController();
  final descriptionController = TextEditingController();

  void _addForm() {
    if (_formKey.currentState!.validate()) {
      final random = Random();
      final idea = AddStartupModel(
        title: titleController.text.trim(),
        tagline: taglineController.text.trim(),
        description: descriptionController.text.trim(),
        rating: random.nextInt(5),
      );
      context.read<AddBloc>().add(AddStartup(idea));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<AddBloc>(context),
      builder: (context, state) {
        if (state is AddLoadingState) {
          Center(child: CircularProgressIndicator());
        } else if (state is AddLoadingState) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38, vertical: 70),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/image_1.jpg',
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Please add your title' : null,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: taglineController,
                      decoration: InputDecoration(
                        labelText: 'Tagline',
                        border: OutlineInputBorder(),
                      ),
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Please add your tagline' : null,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      minLines: 3,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator:
                          (value) =>
                              value!.isEmpty
                                  ? 'Please add your description'
                                  : null,
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      width: 280,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.primaryColor,
                        ),
                        onPressed: _addForm,
                        child: Text(
                          'Add Your Idea',
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorConstant.myTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is AddErrorState) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
