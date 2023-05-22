import 'package:flutter/material.dart';

class MutliSelect extends StatefulWidget {
  final List<String> tagsList;

  const MutliSelect({super.key, required this.tagsList});

  @override
  State<MutliSelect> createState() => _MutliSelectState();
}

class _MutliSelectState extends State<MutliSelect> {
  final List<String> _selectedItems = [];

  void _itemChange(String tagValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(tagValue);
      } else {
        _selectedItems.remove(tagValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: widget.tagsList
          .map((tag) => CheckboxListTile(
                value: _selectedItems.contains(tag),
                onChanged: (isChecked) => _itemChange(tag, isChecked!),
              ))
          .toList(),
    );
  }
}
