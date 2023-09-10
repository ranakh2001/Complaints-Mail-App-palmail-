import 'package:finalproject/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<String> categories = [
    'NGOs',
    'Official Organizations',
    'Official Organizations',
    'UnBorder',
  ];
  int clickedIndex = 0;

  toggleIndex(index) {
    clickedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SafeArea(
          child: CustomAppBar(
        title: 'Category',
      )),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Category',
                      style: TextStyle(
                          color: kinProgressStatus,
                          fontSize: 20,
                          letterSpacing: 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: kinProgressStatus,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: categories.length,
                    itemBuilder: (context, index) => clickedIndex != index
                        ? ListTile(
                            onTap: () {
                              toggleIndex(index);
                              setState(() {});
                            },
                            title: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                categories[index],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )
                        : ListTile(
                            onTap: toggleIndex(index),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                categories[index],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            trailing: Icon(
                              Icons.check,
                              size: 25,
                              color: Colors.blue,
                            ),
                          ),
                    separatorBuilder: (context, index) => index != 2
                        ? Divider(
                            thickness: 1,
                            indent: 15,
                          )
                        : Divider(
                            thickness: 2,
                          )),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
