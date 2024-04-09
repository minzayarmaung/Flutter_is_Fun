import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapplication/constraints/colors.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<String> locations = [];
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Choose a City',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Padding(padding: EdgeInsets.only(bottom: 30)),
                Container(
                  height: 300, // Adjust this value as needed
                  child: Card(
                    color: Colors.grey.withOpacity(0.1),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Card Title',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'Card Subtitle',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Image.network(
                            'https://i.pinimg.com/originals/bd/8b/ff/bd8bffd78009eab632d34294f1b760bb.gif', // Replace with your GIF URL
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(locations[index]),
                        onTap: () {
                          // Handle the tap event, for example, show details in a card
                          // For now, let's just print the selected location
                          print('Selected location: ${locations[index]}');
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // Adjust opacity for transparency
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        //onChanged: (value) => ,
        style: TextStyle(color: Colors.white), // Change text color
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10), // Adjust vertical padding
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white, // Change icon color
            size: 20,
          ),
          suffixIcon: Icon(
            Icons.mic,
            color: Colors.white, // Change icon color
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minHeight: 20),
          suffixIconConstraints: BoxConstraints(
              maxHeight: 20, minHeight: 20), // Added constraint for mic icon
          border: InputBorder.none,
          hintText: ' Search for a city or airport',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
