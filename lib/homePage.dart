import 'dart:convert';

import 'package:es_project/dropDownItem.dart';
import 'package:es_project/informationPage.dart';
import 'package:es_project/location.dart';
import 'package:es_project/noiseLevel.dart';
import 'package:es_project/result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String uri = 'http://192.168.43.191:4000';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  double decibel = 60.0;
  String disease = '';
  int selected = 0;
  String selectedLocation = locations[0].name;
  String time = TimeOfDay.now().hour.toString() +
      '-' +
      (TimeOfDay.now().hour + 1).toString();
  String day = '';
  String typeofarea = locations[0].typeOfLocation;
  Map<String, dynamic> map = {};

  String _selectedtime = TimeOfDay.now().hour.toString() +
      '-' +
      (TimeOfDay.now().hour + 1).toString();
  @override
  void initState() {
    super.initState();
    DateTime.now().weekday == 7 ? day = 'Weekend' : day = 'Week';
    // day = 'Weekend';
    data();
    print(day);
  }

  void data() async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/v1/getReadings'),
        body: jsonEncode(
          {
            "name": selectedLocation,
            "day": day,
            "typeofarea": typeofarea,
            "time": time,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      map = jsonDecode(res.body);
      print(jsonDecode(res.body));
    } catch (e) {
      print(e.toString());
    }
    setState(() {});
  }

  void _takeTimeInput() async {
    final result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      _selectedtime =
          result!.hour.toString() + ':' + (result.minute).toString();
      time = result!.hour.toString() + '-' + (result.hour + 1).toString();
      data();
    });
  }

  @override
  Widget build(BuildContext context) {
    int i;
    for (i = 0; i < info.length; i++) {
      if (info[i].level <= decibel) {
        disease = info[i].disease;
        break;
      }
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: const Text(
            'Noise Tracker',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 142, 192, 233),
              Color.fromARGB(255, 150, 219, 230),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/polImg2.webp',
              // height: 200,
              // width: 800,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Select Location',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.blueAccent,
                    Colors.purpleAccent
                    //add more colors
                  ]),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color:
                            Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                        blurRadius: 5) //blur radius of shadow
                  ]),
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: DropdownButton(
                  value: selected,
                  items: [
                    for (int i = 0; i < locations.length; i++)
                      DropdownMenuItem(
                        value: i,
                        child: dropDownItem(
                          idx: i,
                        ),
                      ),
                  ],

                  onChanged: (choice) {
                    setState(() {
                      selected = choice!;
                      selectedLocation = locations[choice].name;
                      typeofarea = locations[choice].typeOfLocation;
                      data();
                    });
                  },

                  isExpanded: true, //make true to take width of parent widget
                  underline: Container(), //empty line
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  dropdownColor: Color.fromARGB(255, 64, 176, 159),
                  iconEnabledColor: Colors.white, //Icon color
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            // Divider(),
            const Text(
              'Select Time',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: _takeTimeInput,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(68, 138, 255, 1),
                      Colors.purpleAccent
                      //add more colors
                    ]),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                          blurRadius: 5) //blur radius of shadow
                    ]),
                child: Container(
                  width: double.infinity,
                  height: 45,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    _selectedtime,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Result',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            result(
              map: map,
              area: typeofarea,
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => informationPage(),
                  ),
                );
              },
              child: const Text(
                'Effects',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
