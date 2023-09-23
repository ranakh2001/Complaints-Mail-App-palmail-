import 'package:finalproject/controllers/sender_controller.dart';
import 'package:finalproject/screens/new%20inbox/new_inbox_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../providers/sender_search_provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/search_bar_widget.dart';
import 'package:http/http.dart' as http;

class SenderSearchView extends StatelessWidget {
  const SenderSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final senderSearchModel = Provider.of<SenderSearchProvider>(context);
    final senderSearchController = senderSearchModel.senderSearchController;
    final filteredSenders = senderSearchModel.filteredSenders;
    //للبحث كانوا دول

    String selectedSender = '';

    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            SafeArea(
              child: CustomAppBar(
                doneFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewInboxView(
                          selectedSender: selectedSender,
                        ),
                      ));
                },
                title: 'Sender',
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: AnimSearchBar(
                autoFocus: true,
                height: 50,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black45.withOpacity(0.6),
                  size: 25,
                ),
                color: kiconColor.withOpacity(0.2),
                helpText: 'Enter Sender Name',
                width: 350,
                searchBarOpen: (int) {},
                textFieldColor: Colors.black45.withOpacity(0.1),
                textFieldIconColor: Colors.black45.withOpacity(0.6),
                rtl: true,
                boxShadow: true,
                textController: senderSearchController,
                onSuffixTap: null,
                onSubmitted: senderSearchModel.searchSender,
              ),
            ),
            Divider(
              indent: 20,
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 270.0),
              child: Text(
                '"sender name"',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              indent: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 260.0),
              child: Text(
                'Official ORGs',
                style: TextStyle(
                    color: Colors.black45.withOpacity(0.5), fontSize: 20),
              ),
            ),
            Divider(
              indent: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getAllSenders(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // You can replace this with your loading widget.
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No senders available.');
                    }

                    return ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                              excludeFromSemantics: true,
                              behavior: HitTestBehavior.deferToChild,
                              onTap: () {
                                selectedSender = snapshot.data![index].name!;
                              },
                              child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        Colors.black45.withOpacity(0.1),
                                    radius: 18,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black45.withOpacity(0.6),
                                    ),
                                  ),
                                  title: snapshot.data![index].category!.name ==
                                          'Official Organizations'
                                      ? Text(snapshot.data![index].name!)
                                      : null),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              indent: 20,
                            ),
                        itemCount: snapshot.data!.length);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300.0),
              child: Text(
                'Other',
                style: TextStyle(
                    color: Colors.black45.withOpacity(0.5), fontSize: 20),
              ),
            ),
            Divider(
              indent: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getAllSenders(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // You can replace this with your loading widget.
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No senders available.');
                    }

                    return ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                              excludeFromSemantics: true,
                              behavior: HitTestBehavior.deferToChild,
                              onTap: () {
                                selectedSender = snapshot.data![index].name!;
                              },
                              child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        Colors.black45.withOpacity(0.1),
                                    radius: 18,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black45.withOpacity(0.6),
                                    ),
                                  ),
                                  title: snapshot.data![index].category!.name ==
                                          'Other'
                                      ? Text(snapshot.data![index].name!)
                                      : null),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              indent: 20,
                            ),
                        itemCount: snapshot.data!.length);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300.0),
              child: Text(
                'NGOs',
                style: TextStyle(
                    color: Colors.black45.withOpacity(0.5), fontSize: 20),
              ),
            ),
            Divider(
              indent: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getAllSenders(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // You can replace this with your loading widget.
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No senders available.');
                    }

                    return ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                              excludeFromSemantics: true,
                              behavior: HitTestBehavior.deferToChild,
                              onTap: () {
                                selectedSender = snapshot.data![index].name!;
                              },
                              child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        Colors.black45.withOpacity(0.1),
                                    radius: 18,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black45.withOpacity(0.6),
                                    ),
                                  ),
                                  title: snapshot.data![index].category!.name ==
                                          'NGOs'
                                      ? Text(snapshot.data![index].name!)
                                      : null),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              indent: 20,
                            ),
                        itemCount: snapshot.data!.length);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300.0),
              child: Text(
                'Foreign',
                style: TextStyle(
                    color: Colors.black45.withOpacity(0.5), fontSize: 20),
              ),
            ),
            Divider(
              indent: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getAllSenders(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // You can replace this with your loading widget.
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No senders available.');
                    }

                    return ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                              excludeFromSemantics: true,
                              behavior: HitTestBehavior.deferToChild,
                              onTap: () {
                                selectedSender = snapshot.data![index].name!;
                              },
                              child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        Colors.black45.withOpacity(0.1),
                                    radius: 18,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black45.withOpacity(0.6),
                                    ),
                                  ),
                                  title: snapshot.data![index].category!.name ==
                                          'Foreign'
                                      ? Text(snapshot.data![index].name!)
                                      : null),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              indent: 20,
                            ),
                        itemCount: snapshot.data!.length);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
