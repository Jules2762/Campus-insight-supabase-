import 'package:flutter/material.dart';
import 'package:projet_m2/cores/themes/theme_color.dart';

class InputForm extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final IconData? icon;
  const InputForm({super.key, this.label, required this.controller,this.icon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColor.primary,width: 2),
        ),
        
      ),
      controller: controller,
    );
  }
}
