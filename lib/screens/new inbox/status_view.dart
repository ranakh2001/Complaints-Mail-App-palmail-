import 'package:finalproject/screens/widgets/app_bar.dart';
import 'package:flutter/material.dart';


class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<String> statusModes = ['Inbox', 'Pending', 'In Progress', 'Completed'];
  int clickedIndex = 0;
  toggleIndex(index) {
    clickedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SafeArea(
          child: CustomAppBar(
        title: 'Status',
      )),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: ListView.separated(
            itemCount: statusModes.length,
            itemBuilder: (context, index) => clickedIndex != index
                ? ListTile(
                    leading: Container(
                      // padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: () {
                            switch (statusModes[index]) {
                              case 'Inbox':
                                return Colors.red;

                              case 'Pending':
                                return Colors.yellow;
                              case 'In Progress':
                                return Colors.blue;
                              case 'Completed':
                                return Colors.green;
                            }
                          }(),
                          borderRadius: BorderRadius.circular(8)),
                      height: 30,
                      width: 30,
                    ),
                    onTap: () {
                      toggleIndex(index);
                      setState(() {});
                    },
                    // contentPadding: EdgeInsets.all(12),
                    title: Text(
                      statusModes[index],
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          color: () {
                            switch (statusModes[index]) {
                              case 'Inbox':
                                return Colors.red;
                              case 'Pending':
                                return Colors.yellow;
                              case 'In Progress':
                                return Colors.blue;
                              case 'Completed':
                                return Colors.green;
                            }
                          }(),
                          borderRadius: BorderRadius.circular(8)),
                      height: 30,
                      width: 30,
                    ),
                    onTap: toggleIndex(index),
                    // contentPadding: const EdgeInsets.all(12),
                    title: Text(
                      statusModes[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                    trailing: const Icon(
                      Icons.check,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              endIndent: 10,
              indent: 60,
            ),
          ),
        ),
      )
    ]);
  }
}
