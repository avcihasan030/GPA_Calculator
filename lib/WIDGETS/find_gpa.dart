import 'package:flutter/material.dart';
import 'package:flutter_gpa_calculator/CONSTANTS/app_constants.dart';
import 'package:flutter_gpa_calculator/HELPER/data_helper.dart';
import 'package:flutter_gpa_calculator/MODEL/lecture.dart';
import 'package:flutter_gpa_calculator/WIDGETS/buildCredits.dart';
import 'package:flutter_gpa_calculator/WIDGETS/buildLetterGrade.dart';
import 'package:flutter_gpa_calculator/WIDGETS/course_list.dart';
import 'package:flutter_gpa_calculator/WIDGETS/display_gpa.dart';

class FindGpaPage extends StatefulWidget {
  const FindGpaPage({super.key});

  @override
  State<FindGpaPage> createState() => _FindGpaPageState();
}

class _FindGpaPageState extends State<FindGpaPage> {
  var formKey = GlobalKey<FormState>();

  double? selectedValue;
  int? selectedCredits;
  String selectedLectureName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          Constants.textHeader,
          style: Constants.styleHeader,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: DisplayGPA(
                      avg: DataHelper.calcGPA(),
                      lectures: DataHelper.allInsertedLectures.length),
                ),
              ],
            ),

            Expanded(
              child: CourseList(onDismiss: (index) {
                setState(() {
                  DataHelper.allInsertedLectures.removeAt(index);
                });
              }),
            ),
            // list
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // textformfield
          Padding(
            padding: Constants.horizontalPadding8,
            child: _buildTextFormField(),
          ),

          // sizedbox widget
          const SizedBox(height: 5),

          // row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding8,
                  child: BuildLetterGrade(onSelected1: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding8,
                  child: BuildCredits(onSelected2: (value) {
                    setState(() {
                      selectedCredits = value;
                    });
                  }),
                ),
              ),
              IconButton(
                  onPressed: _insertAndCalculate,
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Constants.mainColor,
                    size: 32,
                  )),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          selectedLectureName = newValue!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Ders adını giriniz!";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Data Science',
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Constants.mainColor.shade100.withOpacity(0.3),
      ),
    );
  }

  void _insertAndCalculate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var insertLecture = Lecture(
          name: selectedLectureName,
          gradePoint: selectedValue!,
          credit: selectedCredits!);
      DataHelper.addLecture(insertLecture);
    }
  }
}
