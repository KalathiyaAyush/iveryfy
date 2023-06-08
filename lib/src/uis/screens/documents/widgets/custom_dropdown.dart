import 'package:flutter/material.dart';
import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final List<String> _selectedItems = [];

  bool all = false;
  bool verified = false;
  bool inProgress = false;
  bool rejected = false;

  final List<String> dropdownList = [
    AppStrings.kAll,
    AppStrings.kVerified,
    AppStrings.kinProgress,
    AppStrings.kRejected,
  ];
  void _itemChange(String tagValue, bool ischecked) {
    setState(() {
      if (ischecked) {
        _selectedItems.add(tagValue);
      } else {
        _selectedItems.remove(tagValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h170,
      width: AppWidth.w200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r12),
        color: ColorManager.scaffoldBg,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.12),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView(
                shrinkWrap: true,
                children: dropdownList
                    .map((dTag) => CheckboxListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          dense: true,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: ColorManager.secondaryColor,
                          side: const BorderSide(
                              color: ColorManager.primaryColor),
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            dTag,
                            style: regularTextStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                          ),
                          value: _selectedItems.contains(dTag),
                          onChanged: (isChecked) {
                            _itemChange(dTag, isChecked!);
                          },
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
