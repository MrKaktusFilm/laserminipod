import 'package:flutter/material.dart';
import 'package:user_app/common/enums/boulder_grade_enum.dart';

class DifficultyWheel extends StatelessWidget {
  final void Function(int)? onDifficultyChanged;
  final int? initialDifficulty;

  const DifficultyWheel(
      {super.key, this.onDifficultyChanged, this.initialDifficulty});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: RotatedBox(
        quarterTurns: 3,
        child: ListWheelScrollView.useDelegate(
          controller:
              FixedExtentScrollController(initialItem: initialDifficulty ?? 10),
          itemExtent: 40,
          physics: FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            if (onDifficultyChanged != null) {
              onDifficultyChanged!(index);
            }
          },
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              return Center(
                  child: RotatedBox(
                quarterTurns: 1,
                child: Text(BoulderGradeEnum.fromValue(index)!.getfbScaleName(),
                    style: TextStyle(
                        fontSize: 18,
                        color: BoulderGradeEnum.fromValue(index)!
                            .getDifficultyColor())),
              ));
            },
            childCount: BoulderGradeEnum.values.length,
          ),
        ),
      ),
    );
  }
}
