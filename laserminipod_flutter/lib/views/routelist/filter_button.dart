import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FilterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterControllerAbstract>(
        builder: (context, filtercontroller, child) {
      return Badge.count(
        count: filtercontroller.getActiveFilterCount(),
        isLabelVisible: filtercontroller.getActiveFilterCount() > 0,
        child: FilledButton(
          onPressed: onPressed,
          child: Text(UiHelper.getAppLocalization().filter),
        ),
      );
    });
  }
}
