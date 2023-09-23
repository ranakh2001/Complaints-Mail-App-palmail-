import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/status_controller.dart';
import '../../models/status_model.dart';
import '../../providers/status_provider.dart';
import '../widgets/app_bar.dart';

class StatusView extends StatelessWidget {
  const StatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<List<StatusElement>> statusList;
    statusList = getStatusList();

    final statusModel = Provider.of<StatusProvider>(context);
    int clickedIndex = statusModel.clickedIndex;

    return Column(
      children: [
        SafeArea(
          child: CustomAppBar(
            title: 'Status',
            doneFunction: () {},
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
            child: FutureBuilder(
              future: statusList,
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return CircularProgressIndicator(); // Display a loading indicator while fetching data
                // }
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text(
                      'Error: ${snapshot.error}'); // Handle the error case
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text(
                      'No data available'); // Handle the case when there is no data
                } else {
                  final List<StatusElement> data = snapshot.data!;

                  return ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final StatusElement status = data[index];
                      final bool isSelected = (clickedIndex == index);

                      return ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            color: () {
                              switch (status.name) {
                                case 'Inbox':
                                  return Colors.red;
                                case 'Pending':
                                  return Colors.yellow;
                                case 'In Progress':
                                  return Colors.blue;
                                case 'Completed':
                                  return Colors.green;
                                default:
                                  return Colors.grey;
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
                          status.name ?? '', // Ensure name is not null
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: isSelected
                            ? Icon(
                                Icons.check,
                                size: 25,
                                color: Colors.blue,
                              )
                            : null,
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      endIndent: 10,
                      indent: 60,
                    ),
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
