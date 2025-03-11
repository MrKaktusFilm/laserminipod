import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/abstract/user_controller_abstract.dart';
import 'package:user_app/domain/filter_controller.dart';

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
    List<ListTile> filterItems = [
      // sent filter
      ListTile(
        title: Text('Sent'),
        trailing: Consumer<FilterControllerAbstract>(
            builder: (context, filterController, child) {
          return DropdownButton<bool?>(
            value: filterController.getFilterValue(FilterName.sent),
            items: [
              DropdownMenuItem(value: null, child: Text('---')),
              DropdownMenuItem(value: true, child: Text('Sent')),
              DropdownMenuItem(value: false, child: Text('Not sent'))
            ],
            onChanged: (value) {
              filterController.setFilter(FilterName.sent, value);
            },
          );
        }),
      ),

      // name filter
      ListTile(
        title: Text('Name'),
        subtitle: Consumer<FilterControllerAbstract>(
            builder: (context, filterController, child) {
          return TextField(
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
      ),

      // creator filter
      ListTile(
        title: Text('Creator'),
        trailing: Consumer<FilterControllerAbstract>(
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
      ),
    ];

    return ListView.builder(
        itemCount: filterItems.length,
        itemBuilder: (context, index) {
          return filterItems[index];
        });
  }
}
