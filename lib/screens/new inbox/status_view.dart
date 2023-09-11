import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/status_provider.dart';
import '../widgets/app_bar.dart';
import 'package:http/http.dart' as http;

class StatusView extends StatelessWidget {
  const StatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusModel = Provider.of<StatusProvider>(context);
    int clickedIndex = statusModel.clickedIndex;

    List<String> statusModes = ['Inbox', 'Pending', 'In Progress', 'Completed'];

    return Column(
      children: [
        const SafeArea(
          child: CustomAppBar(
            title: 'Status',
          ),
        ),
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 30,
                        width: 30,
                      ),
                      onTap: () {
                        statusModel.setClickedIndex(index);
                      },
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 30,
                        width: 30,
                      ),
                      onTap: () {
                        statusModel.setClickedIndex(index);
                      },
                      title: Text(
                        statusModes[index],
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(
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
      ],
    );
  }
}
