class Lecture {
  final String name;
  final double gradePoint;
  final int credit;

  Lecture({required this.name, required this.gradePoint, required this.credit});

  @override
  String toString() {
    return 'Lecture{name: $name, gradePoint: $gradePoint, credit: $credit}';
  }
}