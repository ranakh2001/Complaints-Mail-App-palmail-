import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
