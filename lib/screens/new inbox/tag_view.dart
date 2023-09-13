import 'package:finalproject/screens/new%20inbox/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../providers/tag_provider.dart';
import '../widgets/app_bar.dart';

class TagView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tagStateNotifier = context.watch<TagStateNotifier>();

    final List<String> tags = items;

    return Column(children: [
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
                runSpacing: 16,
                spacing: 16,
                children: items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return InkWell(
                    child: Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index < tagStateNotifier.selectedTags.length &&
                                tagStateNotifier.selectedTags[index]
                            ? kcloseBackground
                            : kinProgressStatus,
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          '#$item',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color:
                                index < tagStateNotifier.selectedTags.length &&
                                        tagStateNotifier.selectedTags[index]
                                    ? ktagColor
                                    : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      tagStateNotifier.toggleTag(index);
                    },
                  );
                }).toList(),
              ),
            ),
          )),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          width: 378,
          height: 44,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Add New Tag ...',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: tagStateNotifier.selectedTags.length > items.length &&
                          tagStateNotifier.selectedTags[items.length]
                      ? Colors.white
                      : ksecondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
