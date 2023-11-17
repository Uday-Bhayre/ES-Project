import 'package:es_project/location.dart';
import 'package:flutter/material.dart';

class dropDownItem extends StatelessWidget {
  dropDownItem({
    super.key,
    required this.idx,
  });
  final int idx;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 24,
        child: Text(
          locations[idx].name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
