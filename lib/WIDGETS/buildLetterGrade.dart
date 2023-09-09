import 'package:flutter/material.dart';
import 'package:flutter_gpa_calculator/CONSTANTS/app_constants.dart';
import 'package:flutter_gpa_calculator/HELPER/data_helper.dart';

class BuildLetterGrade extends StatefulWidget {
  final Function onSelected1;

  const BuildLetterGrade({super.key, required this.onSelected1});

  @override
  State<BuildLetterGrade> createState() => _BuildLetterGradeState();
}

class _BuildLetterGradeState extends State<BuildLetterGrade> {
  double selectedValue = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: selectedValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedValue = value!;
            widget.onSelected1(selectedValue);
          });
        },
        underline: Container(),
        items: DataHelper.allGradeItems(),
      ),
    );
  }
}
