import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    BusinessPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Profile App'),
      ),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Business Page'),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String githubUrl = 'https://github.com/minzayarmaung';
  final String mediumUrl = 'https://medium.com/@minzayarmaung2002';
  final String LinkedInUrl =
      'https://www.linkedin.com/in/min-zayar-maung-81a229204/';

  File? _image;
  final picker = ImagePicker();

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: _image != null
                  ? FileImage(_image!)
                  : NetworkImage(
                          'https://avatars.githubusercontent.com/u/94619791?v=4')
                      as ImageProvider<Object>?,
            ),
          ),
          SizedBox(height: 50),
          Text('Min Zayar Maung'),
          Text('minzayarmaung.dev24@gmail.com'),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/256/174/174857.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                onPressed: () {
                  _launchUrl(LinkedInUrl);
                },
              ),
              IconButton(
                icon: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.network(
                    'https://cdn3.iconfinder.com/data/icons/inficons/512/github.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                onPressed: () {
                  _launchUrl(githubUrl);
                },
              ),
              IconButton(
                icon: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.network(
                    'https://cdn.icon-icons.com/icons2/2997/PNG/512/medium_logo_icon_187624.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                onPressed: () {
                  _launchUrl(mediumUrl);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
