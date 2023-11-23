import 'dart:convert';

import 'package:es_project/diseaseCard.dart';
import 'package:es_project/result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String uri = 'http://192.168.43.191:4000';

class diseasePage extends StatefulWidget {
  diseasePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _diseasePageState();
  }
}

class _diseasePageState extends State<diseasePage> {
  List<Disease> diseases = [];

  @override
  void initState() {
    // TODO: implement initState
    print('ready');
    super.initState();
    data();
  }

  void data() async {
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/v1/getAllDiseases'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      List<dynamic> map = jsonDecode(res.body)["diseases"];
      print(map);
      for (int i = 0; i < map.length; i++) {
        diseases.add(
          Disease(
            title: (map[i])['title'],
            discription: (map[i])['description'],
            level: (map[i])['level'],
            range: (map[i])['range'],
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          50,
        ),
        child: AppBar(
          title: Text(
            'Diseases',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: diseases.length != 0
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return diseaseCard(disease: diseases[index]);
                },
                itemCount: diseases.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
