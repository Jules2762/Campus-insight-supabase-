import 'package:flutter/material.dart';
import 'package:projet_m2/cores/themes/theme_color.dart';

class CustomScaffold extends StatelessWidget{
  final String title;
  final Widget body;
  const CustomScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(color: ThemeColor.surface),
        child: body,
      ),
    );
  }
}