import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/filter_controller.dart';
import 'package:user_app/views/difficulty_wheel.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late TextEditingController _routeNameController;
  final TextEditingController _creatorController = TextEditingController();
  late UserControllerAbstract _userController;

  bool minDifficultyActive = false;
  bool maxDifficultyActive = false;

  @override
  void initState() {
    super.initState();
    final filterController =
        Provider.of<FilterControllerAbstract>(context, listen: false);
    _userController =
        Provider.of<UserControllerAbstract>(context, listen: false);

    // setup _routeNameController
    _routeNameController = TextEditingController(
        text: filterController.getFilterValue(FilterName.routeName));
    _routeNameController.addListener(() {
      final text = _routeNameController.text.trim();
      filterController.setFilter(
          FilterName.routeName, text.isEmpty ? null : text);
    });

    _userController.loadAllUsers();

    minDifficultyActive =
        filterController.getFilterValue(FilterName.minDifficulty) != null;
    maxDifficultyActive =
        filterController.getFilterValue(FilterName.maxDifficulty) != null;
  }

  @override
  void dispose() {
    _routeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: fix navigation issue

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),

        // sent filter
        Consumer<FilterControllerAbstract>(
            builder: (context, filterController, child) {
          return DropdownMenu<bool?>(
            label: Text('Sent'),
            initialSelection: filterController.getFilterValue(FilterName.sent),
            dropdownMenuEntries: [
              DropdownMenuEntry(value: null, label: '---'),
              DropdownMenuEntry(value: true, label: 'Sent'),
              DropdownMenuEntry(value: false, label: 'Not sent')
            ],
            onSelected: (value) {
              filterController.setFilter(FilterName.sent, value);
            },
          );
        }),
        const SizedBox(height: 10),

        // route name filter
        Consumer<FilterControllerAbstract>(
            builder: (context, filterController, child) {
          return TextField(
            decoration: InputDecoration(labelText: 'Route name'),
            controller: _routeNameController,
            onChanged: (value) {
              if (value.trim().isEmpty) {
                filterController.setFilter(FilterName.routeName, null);
              } else {
                filterController.setFilter(FilterName.routeName, value);
              }
            },
          );
        }),
        const SizedBox(height: 20),

        // creator filter
        Consumer<FilterControllerAbstract>(
            builder: (context, filterController, child) {
          return FutureBuilder(
              future: _userController.loadAllUsers(),
              builder: (context, snapshot) {
                var entries = _userController.users.map((user) {
                  return DropdownMenuEntry<int?>(
                      value: user.id!, label: user.userName!);
                }).toList();
                // add 'deselect' entry
                entries.insert(
                    0, DropdownMenuEntry<int?>(value: null, label: '---'));

                return DropdownMenu<int?>(
                  label: Text('Creator'),
                  initialSelection:
                      filterController.getFilterValue(FilterName.creator),
                  controller: _creatorController,
                  enableFilter: true,
                  enableSearch: true,
                  requestFocusOnTap: true,
                  dropdownMenuEntries: entries,
                  onSelected: (userId) =>
                      filterController.setFilter(FilterName.creator, userId),
                );
              });
        }),
        const SizedBox(height: 10),

        // min difficulty filter
        Row(
          children: [
            Checkbox(
                value: minDifficultyActive,
                onChanged: (value) {
                  setState(() {
                    minDifficultyActive = value!;
                    final filterController =
                        Provider.of<FilterControllerAbstract>(context,
                            listen: false);
                    if (minDifficultyActive) {
                      filterController.setFilter(
                          FilterName.minDifficulty, 10); // default value
                    } else {
                      filterController.setFilter(
                          FilterName.minDifficulty, null);
                    }
                  });
                }),
            SizedBox(width: 10),
            Text('Minimum difficulty')
          ],
        ),
        if (minDifficultyActive)
          Consumer<FilterControllerAbstract>(
              builder: (context, filterController, child) {
            return DifficultyWheel(
              onDifficultyChanged: (p0) =>
                  filterController.setFilter(FilterName.minDifficulty, p0),
              initialDifficulty:
                  filterController.getFilterValue(FilterName.minDifficulty),
            );
          }),

        const SizedBox(height: 10),

        // max difficulty filter
        Row(
          children: [
            Checkbox(
                value: maxDifficultyActive,
                onChanged: (value) {
                  setState(() {
                    maxDifficultyActive = value!;
                    final filterController =
                        Provider.of<FilterControllerAbstract>(context,
                            listen: false);
                    if (maxDifficultyActive) {
                      filterController.setFilter(
                          FilterName.maxDifficulty, 10); // default value
                    } else {
                      filterController.setFilter(
                          FilterName.maxDifficulty, null);
                    }
                  });
                }),
            SizedBox(width: 10),
            Text('Maximum difficulty')
          ],
        ),
        if (maxDifficultyActive)
          Consumer<FilterControllerAbstract>(
              builder: (context, filterController, child) {
            return DifficultyWheel(
              onDifficultyChanged: (p0) =>
                  filterController.setFilter(FilterName.maxDifficulty, p0),
              initialDifficulty:
                  filterController.getFilterValue(FilterName.maxDifficulty),
            );
          }),
        const SizedBox(height: 10),
      ],
    );
  }
}
