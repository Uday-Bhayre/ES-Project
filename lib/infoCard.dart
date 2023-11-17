import 'package:es_project/noiseLevel.dart';
import 'package:flutter/material.dart';

class infoCard extends StatelessWidget {
  const infoCard({
    super.key,
    required this.obj,
  });
  final noiseLevel obj;

  @override
  Widget build(BuildContext context) {
    String nsLev = obj.level.toString();

    return obj.level != 0
        ? Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 69,
                width: 80,
                padding: const EdgeInsets.only(
                  top: 2,
                ),
                decoration: BoxDecoration(
                  color: obj.clr,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(
                      7.5,
                    ),
                  ),
                ),
                child: Text(
                  nsLev,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  alignment: Alignment.center,
                  height: 69,
                  width: (double.maxFinite),
                  color: Colors.white54,
                  child: Text(
                    obj.disease,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: obj.clr,
                      // color: Color.fromARGB(255, 18, 26, 184),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Card(
            margin: EdgeInsets.all(0),
            child: Row(
              children: [
                // SizedBox(
                //   width: 12,
                // ),
                // Text(
                //   'Noise\nLevel',
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.indigo,
                //   ),
                // ),
                Image.asset(
                  'assets/loudSpeaker.jpeg',
                  height: 60,
                  width: 80,
                ),
                const Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.ac_unit,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Effects',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.ac_unit,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
