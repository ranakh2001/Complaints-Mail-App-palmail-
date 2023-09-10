import 'package:flutter/material.dart';

class DecisionContainer extends StatelessWidget {
  const DecisionContainer({
    super.key,
    required this.addDecisionController,
  });

  final TextEditingController? addDecisionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Decision', style: TextStyle(fontSize: 25)),
            Container(
              width: 200,
              child: TextField(
                controller: addDecisionController,
                decoration: InputDecoration(
                  hintText: 'Add decision...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
