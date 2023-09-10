import 'package:finalproject/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/search_bar_widget.dart';

class SenderSearchView extends StatefulWidget {
  const SenderSearchView({Key? key}) : super(key: key);

  @override
  State<SenderSearchView> createState() => _SenderSearchViewState();
}

class _SenderSearchViewState extends State<SenderSearchView> {
  late TextEditingController senderSearchController = TextEditingController();
  List<String> orgsSenders = ['Logain', 'Rana', 'Tasneem'];
  List<String> otherSenders = ['Logain', 'Rana', 'Tasneem'];

  void searchSender(String query) {
    setState(() {
      // Filter orgSenders
      final filteredOrgSenders = orgsSenders.where(
        (sender) => sender.toLowerCase().contains(query.toLowerCase()),
      );

      // Filter otherSenders
      final filteredOtherSenders = otherSenders.where(
        (sender) => sender.toLowerCase().contains(query.toLowerCase()),
      );

      // Combine filtered results from both lists
      filteredSenders = [...filteredOrgSenders, ...filteredOtherSenders];
    });
  }

  List<String> filteredSenders = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          SafeArea(
            child: CustomAppBar(
              title: 'Sender',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: AnimSearchBar(
              autoFocus: true,
              height: 50,
              prefixIcon: Icon(
                CupertinoIcons.search,
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
              onSubmitted: searchSender,
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
              'Official ORG',
              style: TextStyle(
                  color: Colors.black45.withOpacity(0.5), fontSize: 20),
            ),
          ),
          Divider(
            indent: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black45.withOpacity(0.1),
                  radius: 18,
                  child: Icon(
                    Icons.person,
                    color: Colors.black45.withOpacity(0.6),
                  ),
                ),
                title: Text(filteredSenders.isNotEmpty
                    ? filteredSenders[index]
                    : orgsSenders[index]),
              ),
              separatorBuilder: (context, index) => Divider(
                indent: 20,
              ),
              itemCount: filteredSenders.isNotEmpty
                  ? filteredSenders.length
                  : orgsSenders.length,
            ),
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
            child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black45.withOpacity(0.1),
                  radius: 18,
                  child: Icon(
                    Icons.person,
                    color: Colors.black45.withOpacity(0.6),
                  ),
                ),
                title: Text(filteredSenders.isNotEmpty
                    ? filteredSenders[index]
                    : otherSenders[index]),
              ),
              separatorBuilder: (context, index) => Divider(
                indent: 20,
              ),
              itemCount: filteredSenders.isNotEmpty
                  ? filteredSenders.length
                  : otherSenders.length,
            ),
          ),
        ],
      ),
    );
  }
}
