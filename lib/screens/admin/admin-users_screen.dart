import 'package:flutter/material.dart';

import '../../models/user.dart';


class AdminUsersScreen extends StatefulWidget {
  static const id = '/adminUsersScreen';

  final List<User> users;

  const AdminUsersScreen({required this.users, super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.users.length,
                itemBuilder: (context, index) {
                  User user = widget.users[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          // You can add user avatars here
                          backgroundColor: Colors.grey[600],
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[200],
                          ),
                        ),
                        title: Text(user.user?.name ?? 'No Name'),
                        subtitle: Text('Role: ${user.user?.role?.name ?? 'No Role'}'),
                        trailing: DropdownButton(
                          borderRadius: BorderRadius.circular(15),
                          value: user.user?.roleId,
                          items: const [
                            DropdownMenuItem(value: 'guest', child: Text('Guest')),
                            DropdownMenuItem(value: 'admin', child: Text('Admin')),
                            DropdownMenuItem(value: 'user', child: Text('User')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              user.user?.roleId = value.toString();
                            });
                          },
                        ),
                      ),
                      if (index < widget.users.length - 1) const Divider(),
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
                  onPressed: () {
                    // Implement your save logic here, e.g., sending updated user roles to the server.
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Save', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
