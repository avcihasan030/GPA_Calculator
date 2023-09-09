import 'package:flutter/material.dart';
import 'package:flutter_gpa_calculator/CONSTANTS/app_constants.dart';

class DisplayGPA extends StatelessWidget {
  final double avg;
  final int lectures;

  const DisplayGPA({super.key, required this.avg, required this.lectures});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          lectures > 0 ? '$lectures Ders Girildi' : 'Ders Seçiniz',
          style: Constants.fLectures,
        ),
        Text(
          avg > 0 ? avg.toStringAsFixed(2) : '0.0',
          style: Constants.fAverage,
        ),
        Text("Ortalama", style: Constants.fTextAverage),
      ],
    );
  }
}
