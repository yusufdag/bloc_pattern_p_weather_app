import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.selectedCity});

  final String selectedCity;

  @override
  Widget build(BuildContext context) {
    return Text(selectedCity,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ));
  }
}