import 'package:flutter/material.dart';
import 'package:projet_m2/cores/themes/theme_color.dart';

class Button extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool loading;
  final VoidCallback? onPressed;

  const Button({
    super.key,
    this.text,
    this.icon,
    this.loading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ThemeColor.primary),

          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (loading)
              const SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),

            if (icon != null) ...[
              Icon(icon, size: 18),
              const SizedBox(width: 5),
            ],

            if (text != null)
              Text(text!, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
