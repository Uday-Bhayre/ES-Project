import 'package:es_project/infoCard.dart';
import 'package:es_project/noiseLevel.dart';
import 'package:flutter/material.dart';

class informationPage extends StatefulWidget {
  informationPage({super.key});

  @override
  State<informationPage> createState() => _informationPageState();
}

class _informationPageState extends State<informationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          50,
        ),
        child: AppBar(
          title: Text(
            'Hazardous Effects',
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
              Color.fromARGB(255, 30, 108, 233),
              Color.fromARGB(155, 24, 87, 190),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: ListView.builder(
            itemBuilder: (context, idx) => infoCard(obj: info[idx]),
            itemCount: info.length,
          ),
        ),
      ),
    );
  }
}
