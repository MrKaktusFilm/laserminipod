import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/domain/abstract/filter_controller_abstract.dart';
import 'package:user_app/domain/filter_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final FilterControllerAbstract filterController =
        Provider.of<FilterControllerAbstract>(context, listen: false);

    bool? sentFilter;

    List<ListTile> filterItems = [
      // sent filter
      ListTile(
        title: Text('Sent'),
        trailing: DropdownButton(
          value: sentFilter,
          items: [
            DropdownMenuItem(value: null, child: Text('')),
            DropdownMenuItem(value: true, child: Text('Sent')),
            DropdownMenuItem(value: false, child: Text('Not sent'))
          ],
          onChanged: (value) {
            sentFilter = value;
            filterController.setFilter(FilterName.sent, value);
          },
        ),
      ),
    ];
    return ListView.builder(
        itemCount: filterItems.length,
        itemBuilder: (context, index) {
          return filterItems[index];
        });
  }
}
