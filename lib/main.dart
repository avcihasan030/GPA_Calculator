import 'package:flutter/material.dart';
import 'package:flutter_gpa_calculator/CONSTANTS/app_constants.dart';
import 'package:flutter_gpa_calculator/WIDGETS/find_gpa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GPA Calculator",
      theme: ThemeData(
        primarySwatch: Constants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FindGpaPage(),
    );
  }
}
