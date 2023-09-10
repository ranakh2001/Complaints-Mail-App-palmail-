import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Function() onTap;
  const ButtonContainer({super.key, required this.icon, required this.iconColor, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(color: iconColor,fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
