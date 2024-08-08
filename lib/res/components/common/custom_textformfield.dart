import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final IconData? prefixIcon;
  final String label;
  final BorderRadius borderRadius;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  const CustomTextformfield({
    super.key,
    this.prefixIcon,
    required this.label,
    required this.borderRadius,
    required this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: theme.colorScheme.primary,
        ),
        label: Text(label),
        filled: true,
        fillColor: const Color(0xff08131E),
        border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 32, 48, 62)),
            borderRadius: borderRadius),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 32, 48, 62)),
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 32, 48, 62)),
            borderRadius: borderRadius),
        suffixIcon: Icon(
          suffixIcon,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
