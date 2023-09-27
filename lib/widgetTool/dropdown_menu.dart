import 'package:flutter/material.dart';

class DropdownMenuPage extends StatefulWidget {
  const DropdownMenuPage({super.key});

  @override
  State<DropdownMenuPage> createState() => _DropdownMenuPageState();
}

class _DropdownMenuPageState extends State<DropdownMenuPage> {
  final List _fruits = ["Apple", "Banana", "Orange", "Peach", "Pineapple"];
  late List<DropdownMenuItem> _dropdownMenuItems;
  late String _selectedItem;
  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = _buildAndGetDropdownMenuItems();
    _selectedItem = _dropdownMenuItems.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DropdownButton(
            value: _selectedItem,
            items: _dropdownMenuItems,
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem> _buildAndGetDropdownMenuItems() {
    List<DropdownMenuItem> items = [];
    for (var item in _fruits) {
      items.add(DropdownMenuItem(
        value: item,
        child: Text(item),
      ));
    }
    return items;
  }
}
