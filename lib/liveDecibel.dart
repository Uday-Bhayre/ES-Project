import 'dart:convert';

import 'package:es_project/disease.dart';
import 'package:es_project/homePage.dart';
import 'package:es_project/informationPage.dart';
import 'package:es_project/result.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:noise_meter/noise_meter.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

String uri = 'http://192.168.43.191:4000';

class NoiseMeterApp extends StatefulWidget {
  @override
  _NoiseMeterAppState createState() => _NoiseMeterAppState();
}

class _NoiseMeterAppState extends State<NoiseMeterApp> {
  bool _isRecording = false;
  NoiseReading? _latestReading;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  late NoiseMeter noiseMeter;
  double avg = 0.0;
  double max = 0.0;
  double prevAvg = 1;
  int i = 1;
  List<Disease> disease = [];

  @override
  void initState() {
    super.initState();

    requestPermission();
    noiseMeter = NoiseMeter();
  }

  void data() async {
    try {
      if (avg < 1000) {
        http.Response res = await http.post(
          Uri.parse('$uri/api/v1/getDiseases'),
          body: jsonEncode(
            {
              'noiseLevel': avg,
            },
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        List<dynamic> map = jsonDecode(res.body)["diseases"];
        print(map);
        for (int i = 0; i < map.length; i++) {
          disease.add(
            Disease(
              title: (map[i])['title'].toString(),
              discription: (map[i])['description'].toString(),
              level: (map[i])['level'].toString(),
              range: (map[i])['range'].toString(),
            ),
          );
        }
      }
    } catch (e) {
      print(e.toString());
    }
    setState(() {});
  }

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    super.dispose();
  }

  void onData(NoiseReading noiseReading) => setState(() {
        _latestReading = noiseReading;
        if (_latestReading != null) {
          // print(_latestReading!.meanDecibel);
          if (_latestReading!.meanDecibel < 10000 && i >= 3) {
            print(i);
            print(avg);

            avg = (i - 1) * prevAvg + _latestReading!.meanDecibel.toDouble();
            avg /= i;
            prevAvg = avg;
            i++;
            if (_latestReading!.meanDecibel > max) {
              max = _latestReading!.meanDecibel;
            }
          }
          if (i < 3) {
            i++;
          }
        }
      });

  void onError(Object error) {
    print(error);
    stop();
  }

  Future<bool> checkPermission() async {
    print('checking');
    return await Permission.microphone.isGranted;
  }

  Future<PermissionStatus> requestPermission() async {
    print('request');
    PermissionStatus permissionStatus = await Permission.microphone.request();
    print(permissionStatus.isGranted);
    return permissionStatus;
  }

  Future<void> start() async {
    print("Start");
    _latestReading = null;
    disease = [];
    max = 0;
    avg = 0;
    i = 1;
    prevAvg = 1;
    _noiseSubscription = noiseMeter.noise.listen(onData);
    print(_noiseSubscription);
    setState(() => _isRecording = true);
  }

  void stop() {
    print('Stop');
    _noiseSubscription?.cancel();
    data();
    setState(() => _isRecording = false);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => homePage(),
                            )),
                        child: const Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ))
                  ],
                ),
                IconButton(
                  onPressed: _isRecording ? stop : start,
                  icon: _isRecording
                      ? Icon(
                          Icons.stop,
                          color: Colors.red,
                          size: 40,
                        )
                      : Icon(
                          Icons.mic,
                          color: Color.fromARGB(255, 0, 119, 255),
                          size: 40,
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Colors.blueAccent,
                        Color.fromARGB(255, 64, 201, 251)
                        //add more colors
                      ]),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromRGBO(
                                0, 0, 0, 0.57), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 10,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Noise Level',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Avg',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  avg != 0
                                      ? avg.toString().substring(0, 5)
                                      : '0',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  _latestReading != null
                                      ? _latestReading!.meanDecibel
                                          .toString()
                                          .substring(0, 5)
                                      : '0.0',
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  "Max",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  max != 0
                                      ? max.toString().substring(0, 5)
                                      : '0',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      if (disease.length != 0 && avg > 50)
                        Text(
                          'Possible Diseases',
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
                      disease.length == 0
                          ? SizedBox(
                              height: 100,
                              child: Center(
                                child: Text(
                                  'Please click on the mic icon to start',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )
                          : avg > 50
                              ? Expanded(
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return result(
                                        disease: disease[index],
                                      );
                                    },
                                    itemCount: disease.length,
                                  ),
                                )
                              : Card(
                                  elevation: 8,
                                  child: Container(
                                    height: 100,
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 83, 218, 225),
                                          Color.fromARGB(255, 107, 216, 222),
                                          // const Color.fromARGB(255, 68, 243, 33),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text(
                                      'Safe Level',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              244, 255, 255, 255)),
                                    ),
                                  ),
                                ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
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
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => diseasePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Diseases',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
