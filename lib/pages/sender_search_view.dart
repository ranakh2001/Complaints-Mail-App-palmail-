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

  void searchSender() {}

  @override
  Widget build(BuildContext context) {
    List<String> orgsSenders = ['Logain', 'Rana', 'Tasneem'];
    List<String> otherSenders = ['Logain', 'Rana', 'Tasneem'];
    return Container(
      color: backgroundColor,
      child: Column(children: [
        SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'cancel',
                    style: TextStyle(fontSize: 25, color: kinProgressStatus),
                  ),
                  Text(
                    'Sender',
                    style: TextStyle(fontSize: 25, color: ktitleBlack),
                  ),
                  Text(
                    'Done',
                    style: TextStyle(fontSize: 25, color: kinProgressStatus),
                  ),
                ],
              )),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: SearchBar(
        //     controller: senderSearchController,
        //     leading: Icon(
        //       CupertinoIcons.search,
        //       color: Colors.black45.withOpacity(0.3),
        //       size: 30,
        //     ),
        //     backgroundColor:
        //         MaterialStatePropertyAll(ksecondaryColor.withOpacity(0.2)),
        //     hintText: 'Enter Sender Name',
        //     hintStyle: MaterialStatePropertyAll<TextStyle>(
        //         TextStyle(color: Colors.black45.withOpacity(0.3))),
        //   ),
        // )
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
            onSubmitted: (String) {
              // searchSender;
            },
          ),
        ),
        Divider(),
        SizedBox(
          height: 8,
        ),
        Text(
          '"sender name"',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 8,
        ),

        Divider(),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 300.0),
          child: Text(
            'Official ORG',
            style:
                TextStyle(color: Colors.black45.withOpacity(0.5), fontSize: 15),
          ),
        ),

        Divider(),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black45.withOpacity(0.1),
                          radius: 18,
                          child: Icon(
                            Icons.person,
                            color: Colors.black45.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(orgsSenders[index])
                    ],
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: orgsSenders.length),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 300.0),
          child: Text(
            'other',
            style:
                TextStyle(color: Colors.black45.withOpacity(0.5), fontSize: 15),
          ),
        ),

        Divider(),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black45.withOpacity(0.1),
                          radius: 18,
                          child: Icon(Icons.person,
                              color: Colors.black45.withOpacity(0.6)),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(orgsSenders[index])
                    ],
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: otherSenders.length),
        )
      ]),
    );
  }
}
