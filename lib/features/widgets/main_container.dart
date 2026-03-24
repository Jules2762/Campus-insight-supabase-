import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final Widget body;
  const MainContainer({super.key,required this.body});
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      children: [
        body
      ],
    );
  }
}