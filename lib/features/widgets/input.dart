import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? label;
  final bool showBorder;
  final IconData? prefixIcon;
  final TextEditingController controller;
  const Input({
    super.key,
    this.label,
    this.prefixIcon,
    this.showBorder = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true, // <-- important pour le bg
        fillColor: Colors.white,

        labelText: (label != null && label!.isNotEmpty) ? label : null,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(prefixIcon),
        border: showBorder
            ? OutlineInputBorder()
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
      ),
    );
  }
}
