import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final EdgeInsets padding;
  const CustomButton({
    super.key, required this.text, required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,//const EdgeInsets.only(top: 80),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child:  Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 80.0, vertical: 15),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}