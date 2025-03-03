import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/common/enums/boulder_grade_enum.dart';
import 'package:user_app/domain/abstract/route_controller_abstract.dart';
import 'package:user_app/domain/ui_helper.dart'; // Importiere den UiHelper

class SaveRouteDialog extends StatefulWidget {
  const SaveRouteDialog({super.key});

  @override
  State<SaveRouteDialog> createState() => _SaveRouteDialogState();
}

class _SaveRouteDialogState extends State<SaveRouteDialog> {
  final _formKey = GlobalKey<FormState>();

  int _selectedDifficulty = 10;
  String? _routeDescription;

  void _onSave() async {
    final controller =
        Provider.of<RouteControllerAbstract>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      controller.saveCurrentRoute(_routeDescription, _selectedDifficulty);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<RouteControllerAbstract>(context, listen: false);
    final loc = UiHelper.getAppLocalization(); // Zugriff auf Lokalisierungen

    return Form(
      key: _formKey,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: loc.routeName, // Verwendung der Lokalisierung
                  filled: true,
                  errorText: controller.nameErrorMessage,
                ),
                onChanged: (value) {
                  controller.updateNameStatus(value);
                },
                validator: (input) {
                  return controller.validateRouteName(input);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: loc.routeDescription,
                  filled: true,
                ),
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    _routeDescription = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text(loc.selectDifficulty,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 100,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: ListWheelScrollView.useDelegate(
                    controller: FixedExtentScrollController(initialItem: 10),
                    itemExtent: 40,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedDifficulty = index + 1;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                            child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                              BoulderGradeEnum.fromValue(index)!
                                  .getfbScaleName(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: BoulderGradeEnum.fromValue(index)!
                                      .getDifficultyColor())),
                        ));
                      },
                      childCount: BoulderGradeEnum.values.length - 1,
                    ),
                  ),
                ),
              ),
              if (controller.isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircularProgressIndicator(),
                ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: _onSave,
                    child: Text(loc.save), // Verwendung der Lokalisierung
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(loc.cancel), // Verwendung der Lokalisierung
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
