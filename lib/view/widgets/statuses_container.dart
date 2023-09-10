import 'package:finalproject/constants.dart';
import 'package:finalproject/providers/mail_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class StatusesContainer extends StatelessWidget {
  const StatusesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Provider.of<MailFilterProvider>(context, listen: false)
                    .toggleStatus(index);
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Provider.of<MailFilterProvider>(context)
                          .statuses[index]
                          .color,
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    Provider.of<MailFilterProvider>(context)
                        .statuses[index]
                        .title,
                    style: TextStyle(fontSize: 16, color: ktitleBlack),
                  ),
                  const Spacer(),
                  Provider.of<MailFilterProvider>(context)
                          .statuses[index]
                          .isSelected
                      ? SvgPicture.asset(
                          'assets/icons/selected.svg',
                          width: 20,
                          height: 20,
                        )
                      : const SizedBox(),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
                color: kdividerColor,
              ),
          itemCount: Provider.of<MailFilterProvider>(context).statuses.length),
    );
  }
}
