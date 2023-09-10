import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final String? Function(String?)? validatorFunction;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.validatorFunction, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validatorFunction,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
