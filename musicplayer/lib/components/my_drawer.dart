import 'package:flutter/material.dart';
import 'package:musicplayer/pages/settings_page.dart';

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
              padding: const EdgeInsets.only(left: 25, top: 25),
              child: ListTile(
                title: const Text('H O M E'),
                leading: const Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              )),

          Padding(
              padding: const EdgeInsets.only(left: 25, top: 0),
              child: ListTile(
                title: const Text('S E T T I N G S'),
                leading: const Icon(Icons.settings),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              )),

          // Logout Title
          Padding(
              padding: const EdgeInsets.only(left: 25, top: 0),
              child: ListTile(
                title: const Text('L O G O U T'),
                leading: const Icon(Icons.logout),
                onTap: () {},
              )),
          // About Title
          Padding(
              padding: const EdgeInsets.only(left: 25, top: 0),
              child: ListTile(
                title: const Text('A B O U T '),
                leading: const Icon(Icons.info),
                onTap: () {},
              )),

          // Settings Title
        ],
      ),
    );
  }
}
