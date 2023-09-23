import 'package:finalproject/controllers/categories_controller.dart';
import 'package:finalproject/models/category_model.dart';
import 'package:finalproject/screens/new%20inbox/categories_view.dart';
import 'package:finalproject/screens/new%20inbox/sender_search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SenderAndCategoryContainer extends StatelessWidget {
  const SenderAndCategoryContainer({
    super.key,
    this.senderController,
    this.selectedCategory,
  });

  final TextEditingController? senderController;
  final CategoryElement? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
                hintStyle: TextStyle(color: kiconColor),
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    CupertinoIcons.person,
                    color: kiconColor,
                  ),
                ),
                suffix: IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: SendersView()));
                  },
                  icon: IconButton(
                    icon: Icon(
                      CupertinoIcons.info,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SenderSearchView(),
                          ));
                    },
                  ),
                  color: kinProgressStatus,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryView(),
                        ));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          selectedCategory == null
                              ? 'Other'
                              : selectedCategory!.name ?? '',
                          style:
                              TextStyle(color: ksecondaryColor, fontSize: 16),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: ksecondaryColor,
                          size: 30,
                        ),
                      ],
                    ),
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
