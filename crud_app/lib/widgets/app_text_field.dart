import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;
  final String label;

  const AppTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(border: OutlineInputBorder()),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is missing';
        }
        return null;
      },
    );
  }
}
