import 'package:es_project/noiseLevel.dart';
import 'package:flutter/material.dart';

class locationResult extends StatelessWidget {
  locationResult({
    super.key,
    required this.map,
    required this.area,
  });
  final Map<String, dynamic> map;
  final String area;

  String effects = '';

  @override
  Widget build(BuildContext context) {
    double avg = map['avg'] == null ? 0 : double.parse(map['avg']);
    double mx = map['max'] == null ? 0 : double.parse(map['max']);

    for (int i = info.length - 1; i > 1; i--) {
      if (avg >= info[i].level) {
        if (info[i].level - avg < avg - info[i - 1].level)
          effects = info[i - 1].disease;
        else
          effects = info[i].disease;
      }
    }
    return SingleChildScrollView(
      child: Card(
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 98, 221, 94),
                // const Color.fromARGB(255, 68, 243, 33),
                Color.fromARGB(255, 151, 220, 116),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              // const SizedBox(
              //   height: 5,
              // ),
              Text(
                area,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 53, 219),
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationThickness: 0.7,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Icon(Icons.noise_control_off),
                  Text(
                    'Noise Level',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 53, 219),
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                      decorationThickness: 0.7,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Average : $avg',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'Maximum : $mx',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Icon(Icons.dangerous_outlined),
                  Text(
                    'Possible Hazardous Effects',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                      decorationThickness: 0.7,
                      color: Color.fromARGB(255, 237, 20, 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                ),
                child: Text(
                  effects,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // color: const Color.fromARGB(255, 237, 20, 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}