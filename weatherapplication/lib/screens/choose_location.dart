import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:weatherapplication/constraints/colors.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<String> locations = [];
  TextEditingController _searchController = TextEditingController();
  String _location = '';

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        setState(() {
          _location =
              '${placemarks[0].locality ?? placemarks[0].subAdministrativeArea ?? placemarks[0].subLocality}, ${placemarks[0].administrativeArea}';
        });
      } catch (e) {
        print('There was a problem with reverse geocoding: $e');
        setState(() {
          _location = '${position.latitude}, ${position.longitude}';
        });
      }
    } catch (e) {
      print('There was a problem retrieving the location: $e');
    }
  }

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
                // Card 1
                Container(
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Colors.lightBlue.withOpacity(0.3),
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/animations/Raining.gif',
                            fit: BoxFit.cover,
                          ),
                        )),
                        Column(
                          children: [
                            ListTile(
                              title: Text(
                                _location,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                DateFormat('EEEE dd • ')
                                    .add_jm()
                                    .format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 40),
                                      child: Text(
                                        'Weather Condition : Clean',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 15, bottom: 35),
                                        child: Text(
                                          '33 °C',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // Card 2
                Container(
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Colors.lightBlue.withOpacity(0.3),
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/animations/Thunder.gif',
                            fit: BoxFit.cover,
                          ),
                        )),
                        Column(
                          children: [
                            ListTile(
                              title: Text(
                                _location,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                DateFormat('EEEE dd • ')
                                    .add_jm()
                                    .format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 40),
                                      child: Text(
                                        'Weather Condition : Clean',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 15, bottom: 35),
                                        child: Text(
                                          '33 °C',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // Card 3
                Container(
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Colors.lightBlue.withOpacity(0.3),
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/animations/dayLight.gif',
                            fit: BoxFit.cover,
                          ),
                        )),
                        Column(
                          children: [
                            ListTile(
                              title: Text(
                                _location,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                DateFormat('EEEE dd • ')
                                    .add_jm()
                                    .format(DateTime.now()),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 40),
                                      child: Text(
                                        'Weather Condition : Clean',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 15, bottom: 35),
                                        child: Text(
                                          '33 °C',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // Card 4

                Expanded(
                  child: ListView.builder(
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(locations[index]),
                        onTap: () {
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

class getCurrentTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;

    return Text(
      'Current Time',
      style: TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
