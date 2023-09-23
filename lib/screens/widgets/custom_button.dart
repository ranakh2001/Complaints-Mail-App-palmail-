import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final EdgeInsets padding;
  final Function() onPressed;
  const CustomButton({
    super.key, required this.text,  this.padding = const EdgeInsets.all(8), required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,//const EdgeInsets.only(top: 80),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),

          ),
          backgroundColor: Colors.blue
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 80.0, vertical: 15),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}