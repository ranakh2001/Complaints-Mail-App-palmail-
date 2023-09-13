import 'package:finalproject/screens/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class TagView extends StatefulWidget {
  const TagView({Key? key}) : super(key: key);

  @override
  State<TagView> createState() => _TagViewState();
}

class _TagViewState extends State<TagView> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    // Add more items dynamically
  ];
  Color selectedTextColor = Colors.white;
  Color unselectedTextColor = ksecondaryColor;
  Color selectedContainerColor = kinProgressStatus;
  Color unselectedContainerColor = kiconColor;

//ليش يعني هدول الموجودين تحتي ،، ما بيرضى نستخدم فيهم المتغيرات اللي معرفها فوقي !!!!

  List<Color> containerColors = List<Color>.filled(
    5, // Change this to items.length
    kiconColor,
  );

  List<Color> textColors = List<Color>.filled(
    5, // Change this to items.length
    ksecondaryColor,
  );
  @override
  Widget build(BuildContext context) {
    // Initialize color lists with the length of items list

    return Column(
      children: [
        // Your other UI code here...
        SafeArea(
          child: CustomAppBar(
            title: 'Tags',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            width: 378,
            height: MediaQuery.of(context).size.height * 0.13,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return InkWell(
                    child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: containerColors[index],
                      ),
                      padding: EdgeInsets.all(8.0),
                      // Adjust padding as needed
                      child: Center(
                        child: Text(
                          '#$item',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: textColors[index]),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        containerColors[index] =
                            (containerColors[index] == unselectedContainerColor)
                                ? selectedContainerColor
                                : unselectedContainerColor;
                        textColors[index] =
                            (textColors[index] == unselectedTextColor)
                                ? selectedTextColor
                                : unselectedTextColor;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              width: 378,
              height: 44,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Add New Tag ...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: unselectedContainerColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
              )),
        ),
      ],
    );
  }
}
