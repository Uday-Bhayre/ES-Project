import 'package:flutter/material.dart';

class Disease {
  String title;
  String discription;
  String level;
  String range;
  Disease({
    required this.title,
    required this.discription,
    required this.level,
    required this.range,
  });
}

class result extends StatelessWidget {
  result({
    super.key,
    required this.disease,
  });
  final Disease disease;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
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
          borderRadius: BorderRadius.circular(8),
        ),
        child: 
           Column(
                children: [
                

                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.coronavirus),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        disease!.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 0, 0),
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dashed,
                          decorationThickness: 0.7,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 3,
                  ),

                  Text(
                    disease!.discription,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        disease.level + ' Noise',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        disease!.range + ' dB',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
      ),
    );
  }
}
