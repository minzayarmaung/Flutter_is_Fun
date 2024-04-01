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
                    child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                    )
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
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
}
