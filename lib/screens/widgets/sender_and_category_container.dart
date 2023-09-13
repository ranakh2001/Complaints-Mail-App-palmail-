import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/util/constants.dart';

class SenderAndCategoryContainer extends StatelessWidget {
  const SenderAndCategoryContainer({
    super.key,
    required this.senderController,
  });

  final TextEditingController? senderController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: 378,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 320,
            child: TextField(
              autofocus: true,
              controller: senderController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Sender',
                  hintStyle: TextStyle(color: kiconColor, fontSize: 16),
                  prefixIcon: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(
                      'assets/icons/person.svg',
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Other',
                        style: TextStyle(color: ksecondaryColor, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: IconButton(
                          icon: Icon(
                            Icons.navigate_next,
                            color: ksecondaryColor,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
