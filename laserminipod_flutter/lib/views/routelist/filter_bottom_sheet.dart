import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/filter_controller.dart';
import 'package:user_app/domain/ui_helper.dart';
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
  }

  @override
  void dispose() {
    _routeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loc = UiHelper.getAppLocalization();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          // sorting
          Consumer<FilterControllerAbstract>(
              builder: (context, filterController, child) {
            return DropdownMenu<SortationName>(
              label: Text(loc.sorting),
              initialSelection: filterController.sortation,
              dropdownMenuEntries: [
                DropdownMenuEntry(
                    value: SortationName.alphabetical,
                    label: SortationName.alphabetical.getName()),
                DropdownMenuEntry(
                    value: SortationName.newest,
                    label: SortationName.newest.getName()),
                DropdownMenuEntry(
                    value: SortationName.oldest,
                    label: SortationName.oldest.getName()),
                DropdownMenuEntry(
                    value: SortationName.hardest,
                    label: SortationName.hardest.getName()),
                DropdownMenuEntry(
                    value: SortationName.easiest,
                    label: SortationName.easiest.getName()),
                DropdownMenuEntry(
                    value: SortationName.mostSents,
                    label: SortationName.mostSents.getName()),
                DropdownMenuEntry(
                    value: SortationName.leastSents,
                    label: SortationName.leastSents.getName()),
              ],
              onSelected: (value) {
                filterController.setSortation(value!);
              },
            );
          }),
          Divider(
            thickness: 7,
            height: 50,
          ),

          // sent filter
          Consumer<FilterControllerAbstract>(
              builder: (context, filterController, child) {
            return DropdownMenu<bool?>(
              label: Text(loc.sent),
              initialSelection:
                  filterController.getFilterValue(FilterName.sent),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: null, label: loc.none),
                DropdownMenuEntry(value: true, label: loc.sent),
                DropdownMenuEntry(value: false, label: loc.notSent)
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
              decoration: InputDecoration(labelText: loc.routeName),
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
                      0, DropdownMenuEntry<int?>(value: null, label: loc.none));

                  return DropdownMenu<int?>(
                    label: Text(loc.creator),
                    initialSelection:
                        filterController.getFilterValue(FilterName.creator),
                    controller: _creatorController,
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
              Consumer<FilterControllerAbstract>(
                  builder: (context, filterController, child) {
                return Checkbox(
                    value: filterController
                        .isFilterActive(FilterName.minDifficulty),
                    onChanged: (value) {
                      setState(() {
                        final filterController =
                            Provider.of<FilterControllerAbstract>(context,
                                listen: false);
                        if (!filterController
                            .isFilterActive(FilterName.minDifficulty)) {
                          filterController.setFilter(
                              FilterName.minDifficulty,
                              DifficultyWheel
                                  .default_difficulty); // default value
                        } else {
                          filterController.setFilter(
                              FilterName.minDifficulty, null);
                        }
                      });
                    });
              }),
              SizedBox(width: 10),
              Text(loc.minDifficulty)
            ],
          ),
          Consumer<FilterControllerAbstract>(
              builder: (context, filterController, child) {
            if (!filterController.isFilterActive(FilterName.minDifficulty)) {
              return SizedBox.shrink();
            }
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
              Consumer<FilterControllerAbstract>(
                  builder: (context, filterController, child) {
                return Checkbox(
                    value: filterController
                        .isFilterActive(FilterName.maxDifficulty),
                    onChanged: (value) {
                      setState(() {
                        final filterController =
                            Provider.of<FilterControllerAbstract>(context,
                                listen: false);
                        if (!filterController
                            .isFilterActive(FilterName.maxDifficulty)) {
                          filterController.setFilter(FilterName.maxDifficulty,
                              DifficultyWheel.default_difficulty);
                        } else {
                          filterController.setFilter(
                              FilterName.maxDifficulty, null);
                        }
                      });
                    });
              }),
              SizedBox(width: 10),
              Text(loc.maxDifficulty)
            ],
          ),
          Consumer<FilterControllerAbstract>(
              builder: (context, filterController, child) {
            if (!filterController.isFilterActive(FilterName.maxDifficulty)) {
              return SizedBox.shrink();
            }
            return DifficultyWheel(
              onDifficultyChanged: (p0) =>
                  filterController.setFilter(FilterName.maxDifficulty, p0),
              initialDifficulty:
                  filterController.getFilterValue(FilterName.maxDifficulty),
            );
          }),
          const SizedBox(height: 10),

          // reset button
          FilledButton(
            onPressed: () {
              final filterController =
                  Provider.of<FilterControllerAbstract>(context, listen: false);
              filterController.resetFilters();
            },
            child: Text(loc.resetFilters),
          ),
        ],
      ),
    );
  }
}
