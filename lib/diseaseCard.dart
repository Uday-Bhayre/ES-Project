import 'package:es_project/result.dart';
import 'package:flutter/material.dart';

class diseaseCard extends StatelessWidget {
  diseaseCard({
    super.key,
    required this.disease,
  });
  final Disease disease;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                size: 10,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                disease.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            disease.discription,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 13,
              ),
              Text(
                '- ' + disease.level,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 13,
              ),
              Text(
                '- ' + disease.range + ' dB',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
