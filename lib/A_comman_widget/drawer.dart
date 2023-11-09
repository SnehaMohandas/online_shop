import 'package:flutter/material.dart';

import '../Settings/settings_mainpage.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              accountName: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Joffin Jose",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              accountEmail: Text("mock123@gmail.com"),
              currentAccountPictureSize: Size.square(40),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'http://192.168.1.14:8000/image/user.jpg'), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Settingsmain(
                          switchLanguage: switchLanguage,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
