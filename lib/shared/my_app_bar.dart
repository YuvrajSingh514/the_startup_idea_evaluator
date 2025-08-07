import 'package:flutter/material.dart';
import 'package:the_startup_idea_evaluator/constants/color_constant.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title, style: TextStyle(
        color: ColorConstant.myTextColor,
        fontWeight: FontWeight.w600
      ),),
      centerTitle: true,
      backgroundColor: ColorConstant.primaryColor,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}