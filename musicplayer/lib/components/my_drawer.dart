import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // Logo
          DrawerHeader(
              child: Center(
                  child: Icon(
            Icons.music_note,
            size: 40,
            color: Theme.of(context).colorScheme.inversePrimary,
          ))),

          // Home Title
          Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: ListTile(
                title: Text('H O M E'),
                leading: Icon(Icons.home),
                onTap: () {},
              )),

          Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: ListTile(
                title: Text('S E T T I N G S'),
                leading: Icon(Icons.settings),
                onTap: () {},
              )),

          // Logout Title
          Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: ListTile(
                title: Text('L O G O U T'),
                leading: Icon(Icons.logout),
                onTap: () {},
              )),
          // About Title
          Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: ListTile(
                title: Text('A B O U T '),
                leading: Icon(Icons.info),
                onTap: () {},
              )),

          // Settings Title
        ],
      ),
    );
  }
}
