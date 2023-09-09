import 'package:flutter/material.dart';
import 'package:flutter_gpa_calculator/MODEL/lecture.dart';

class DataHelper {
  // area of letter grade items'
  static List<String> _letterGradeList() {
    return [
      'AA',
      'BA',
      'BB',
      'CB',
      'CC',
      'DC',
      'DD',
      'FD',
      'FF',
    ];
  }

  static double _convertLetterToGrade(String letterGrade) {
    switch (letterGrade) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allGradeItems() {
    return _letterGradeList()
        .map((e) => DropdownMenuItem(
      value: _convertLetterToGrade(e),
      child: Text(e),
    ))
        .toList();
  }

  // area of number of lectures
  static List<int> _credits() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<int>> allCreditItems() {
    return _credits()
        .map((e) => DropdownMenuItem(
      value: e,
      child: Text(e.toString()),
    ))
        .toList();
  }

  // area of inserted lectures' list
  static List<Lecture> allInsertedLectures = [];

  static addLecture(Lecture lecture) {
    allInsertedLectures.add(lecture);
  }

  static double calcGPA() {
    double totalGradePoint = 0;
    int totalCredits = 0;

    allInsertedLectures.forEach((element) {
      totalGradePoint += (element.credit * element.gradePoint);
      totalCredits += element.credit;
    });

    return totalGradePoint / totalCredits;
  }
}
