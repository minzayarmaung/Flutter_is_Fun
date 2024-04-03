import 'package:flutter/material.dart';
import 'package:weatherapp/constraints/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}
// void _runFilter(String searchKeyword){
//   List<City> results = [];
//   if(searchKeyword.isEmpty){
//     results =
//   } else {
//     results = cityList
//       .where((city) =>
//         city.cityText!.toLowerCase().contains(searchKeyword.toLowerCase())
//         .cityList();

//     )
//   }
// }

class _ChooseLocationState extends State<ChooseLocation> {
  List<String> locations = [];
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
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
}

Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: TextField(
      //onChanged: (value) => ,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, minHeight: 20),
        border: InputBorder.none,
        hintText: 'Search a new City',
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ),
  );
}
