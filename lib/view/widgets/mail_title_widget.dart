import 'package:flutter/material.dart';

class MailTitle extends StatelessWidget {
    final Color? statusColor;

  const MailTitle({super.key, this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: statusColor),
              ),
             const SizedBox(
                width: 8,
              ),
              Text("Organization Name",
                  style: Theme.of(context).textTheme.bodyMedium),
              const Spacer(),
              Text(
                "Today, 11:00 AM",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Icon(
                Icons.arrow_forward_ios,
              )
            ],
          );
  }
}