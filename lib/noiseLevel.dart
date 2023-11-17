import 'package:flutter/material.dart';

class noiseLevel {
  final double level;
  final String disease;
  final Color clr;
  noiseLevel({
    required this.level,
    required this.disease,
    required this.clr,
  });
}

List<noiseLevel> info = [
  noiseLevel(
    level: 0,
    disease: 'Instantaneous hearing loss',
    clr: const Color.fromARGB(255, 234, 17, 17),
  ),
  noiseLevel(
    level: 150,
    disease: 'Instantaneous hearing loss',
    clr: const Color.fromARGB(255, 234, 17, 17),
  ),
  noiseLevel(
    level: 135,
    disease: 'Painful',
    clr: Color.fromARGB(255, 176, 40, 40),
  ),
  noiseLevel(
    level: 120,
    disease: 'Causes the pain in the inner ear',
    clr: Color.fromARGB(210, 155, 45, 45),
  ),
  noiseLevel(
    level: 110,
    disease: 'Discomfort, may cause hearing loss',
    clr: Color.fromARGB(255, 167, 35, 143),
  ),
  noiseLevel(
    level: 100,
    disease:
        'Short period-temporary impairment,\nProlonged-irreparable damage to auditory',
    clr: const Color.fromARGB(255, 167, 24, 72),
  ),
  noiseLevel(
    level: 90,
    disease: 'Many years of exposure-permanent hear loss',
    clr: Color.fromARGB(255, 112, 18, 171),
  ),
  noiseLevel(
    level: 88,
    disease: 'Hearing disorder if prolonged exposure',
    clr: Color.fromARGB(255, 40, 108, 203)
  ),
  noiseLevel(
    level: 80,
    disease: 'Annoying/Irritating',
    clr: Color.fromARGB(255, 17, 116, 119),
  ),
  noiseLevel(
    level: 65,
    disease: 'Annoyance-Nervous Effects',
    clr: Color.fromARGB(255, 30, 191, 46),
  ),
 
  noiseLevel(
    level: 45.3,
    disease: 'Tolerable',
    clr: Color.fromARGB(255, 171, 146, 22),
  ),

];
