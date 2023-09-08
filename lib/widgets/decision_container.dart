import 'package:flutter/material.dart';

import '../constants.dart';

class DecisionContainer extends StatelessWidget {
  const DecisionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Decision",
                          style: TextStyle(color: ktitleBlack, fontSize: 18),
                        ),
                        Text(
                          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distra ''',
                          softWrap: true,
                          style: TextStyle(fontSize: 14, color: ktitleBlack),
                        )
                      ],
                    ),
                  );
  }
}