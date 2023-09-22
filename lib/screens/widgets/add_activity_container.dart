import 'package:finalproject/providers/mail_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants.dart';

class AddActivityContainer extends StatelessWidget {
  const AddActivityContainer({
    super.key,
    required this.addNewActivityController,
  });

  final TextEditingController? addNewActivityController;

  @override
  Widget build(BuildContext context) {
    return Consumer<MailProvider>(
      builder: (context, mailProvider, child) {
        return TextField(
          controller: addNewActivityController,
          decoration: InputDecoration(
            suffixIconConstraints: const BoxConstraints(),
            prefixIconConstraints: const BoxConstraints(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            hintText: 'Add new Activity …',
            hintStyle: TextStyle(fontSize: 14, color: kdescriptionColor),
            suffixIcon: GestureDetector(
              onTap: () {
                mailProvider.addnewAcitivity();
              },
              child: SvgPicture.asset(
                'assets/icons/send.svg',
              ),
            ),
            prefixIcon: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?pid=ImgDet&rs=1'))),
            ),
            filled: true,
            fillColor: ktextFieldFillColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
          ),
        );
      },
    );
  }
}
