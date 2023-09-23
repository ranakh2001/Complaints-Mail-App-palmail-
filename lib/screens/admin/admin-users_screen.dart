import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminUsersScreen extends StatefulWidget {
  static const id = '/adminUsersScreen';

  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  String? selectedValue;


  @override
  void initState() {
    // TODO: implement initState


  }



  // List listItem = [
  //   'gust',
  //   'admin',
  //   'user',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/menu.svg',
                  width: 26,
                  height: 10,
                ),
                const Text(
                  'users',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                          title: Text('user $index'),
                          subtitle: const Text('user role'),
                          trailing: DropdownButton(
                            borderRadius: BorderRadius.circular(15),
                            value: selectedValue,
                            items: const [
                              DropdownMenuItem(
                                  value: 'gust', child: Text('gust')),
                              DropdownMenuItem(
                                  value: 'admin', child: Text('admin')),
                              DropdownMenuItem(
                                  value: 'user', child: Text('user')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          )),
                      if (index < 2) const Divider(),
                    ],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}