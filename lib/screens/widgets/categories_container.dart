import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class CategoriewContainer extends StatelessWidget {
  const CategoriewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(30)),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Provider.of<MailFilterProvider>(context, listen: false)
                  //     .toggleCategory(index);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'status',
                        // Provider.of<MailFilterProvider>(context)
                        //     .categorys[index]
                        //     .title,
                        style: TextStyle(color: ktitleBlack, fontSize: 16),
                      ),
                      // Provider.of<MailFilterProvider>(context)
                      //         .categorys[index]
                      //         .isSelected
                      //     ? SvgPicture.asset(
                      //         'assets/icons/selected.svg',
                      //         width: 20,
                      //         height: 20,
                      //       )
                      //     : const SizedBox()
                    ]),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: kdividerColor,
                ),
            itemCount: 4));
  }
}
