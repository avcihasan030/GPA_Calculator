import 'package:flutter/material.dart';
import 'package:flutter_gpa_calculator/CONSTANTS/app_constants.dart';
import 'package:flutter_gpa_calculator/HELPER/data_helper.dart';
import 'package:flutter_gpa_calculator/MODEL/lecture.dart';

class CourseList extends StatelessWidget {
  final Function onDismiss;
  const CourseList({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    List<Lecture> courseList = DataHelper.allInsertedLectures;
    return courseList.isNotEmpty
        ? ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            onDismiss(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              child: ListTile(
                title: Text(courseList[index].name),
                leading: CircleAvatar(
                  backgroundColor: Constants.mainColor,
                  child: Text((courseList[index].gradePoint *
                      courseList[index].credit)
                      .toStringAsFixed(0)),
                ),
                subtitle: Text(
                    "Kredi: ${courseList[index].credit}\t Harf Notu: ${courseList[index].gradePoint}"),
              ),
            ),
          ),
        );
      },
      itemCount: courseList.length,
    )
        : Center(
      child: Text(
        "Lütfen Ders Ekleyiniz!",
        style: Constants.styleHeader,
      ),
    );
  }
}
