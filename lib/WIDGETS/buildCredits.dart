import 'package:flutter/material.dart';
import 'package:flutter_gpa_calculator/CONSTANTS/app_constants.dart';
import 'package:flutter_gpa_calculator/HELPER/data_helper.dart';

class BuildCredits extends StatefulWidget {
  final Function onSelected2;
  const BuildCredits({super.key, required this.onSelected2});

  @override
  State<BuildCredits> createState() => _BuildCreditsState();
}

class _BuildCreditsState extends State<BuildCredits> {
  int selectedCredits = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<int>(
        value: selectedCredits,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedCredits = value!;
            widget.onSelected2(selectedCredits);
          });
        },
        underline: Container(),
        items: DataHelper.allCreditItems(),
      ),
    );
  }
}
