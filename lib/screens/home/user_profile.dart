import 'package:finalproject/screens/widgets/home_appBar.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [const HomeAppBar()],
          body: Column(
            children: [
              Stack(children: [
                const CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?pid=ImgDet&rs=1',
                  ),
                ),
                Positioned(
                    right: 5,
                    bottom: 5,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_a_photo_rounded,
                          color: Colors.black,
                          size: 32,
                        )))
              ])
            ],
          )),
    );
  }
}
