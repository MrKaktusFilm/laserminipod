import 'dart:ui';

import 'package:flutter/material.dart';

enum HandleStateEnum {
  normal(0),
  footOnly(1),
  start(2),
  finish(3),
  deactivated(4);

  final int value;

  const HandleStateEnum(this.value);

  HandleStateEnum increase() {
    return HandleStateEnum.values[(index + 1) % HandleStateEnum.values.length];
  }

  Color getStateColor() {
    switch (value) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.purple;
      case 3:
        return Colors.yellow;

      default:
        return Colors.red;
    }
  }

  bool isLastElement() {
    return value == HandleStateEnum.values.length - 1;
  }

  static HandleStateEnum? fromValue(int value) {
    return HandleStateEnum.values.firstWhere(
      (grade) => grade.value == value,
      orElse: () => throw ArgumentError("Ungültiger Wert: $value"),
    );
  }
}
