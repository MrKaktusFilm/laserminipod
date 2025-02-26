import 'package:flutter/material.dart';

enum BoulderGradeEnum {
  f3(0),
  f4(1),
  f4plus(2),
  f5(3),
  f5plus(4),
  f6A(5),
  f6Aplus(6),
  f6B(7),
  f6Bplus(8),
  f6C(9),
  f6Cplus(10),
  f7A(11),
  f7Aplus(12),
  f7B(13),
  f7Bplus(14),
  f7C(15),
  f7Cplus(16),
  f8A(17),
  f8Aplus(18),
  f8B(19),
  f8Bplus(20),
  f8C(21),
  f8Cplus(22),
  f9A(23);

  final int value;

  const BoulderGradeEnum(this.value);

  String getfbScaleName() {
    return [
      "3",
      "4",
      "4+",
      "5",
      "5+",
      "6A",
      "6A+",
      "6B",
      "6B+",
      "6C",
      "6C+",
      "7A",
      "7A+",
      "7B",
      "7B+",
      "7C",
      "7C+",
      "8A",
      "8A+",
      "8B",
      "8B+",
      "8C",
      "8C+",
      "9A"
    ][value];
  }

  Color getDifficultyColor() {
    if (value < BoulderGradeEnum.f5.value) {
      return const Color.fromARGB(255, 185, 167, 0);
    }
    if (value < BoulderGradeEnum.f6Cplus.value) return Colors.blue;
    if (value < BoulderGradeEnum.f8A.value) return Colors.green;
    if (value < BoulderGradeEnum.f8C.value) return Colors.red;
    return Colors.black;
  }

  static BoulderGradeEnum? fromValue(int value) {
    return BoulderGradeEnum.values.firstWhere(
      (grade) => grade.value == value,
      orElse: () => throw ArgumentError("Ungültiger Wert: $value"),
    );
  }
}
