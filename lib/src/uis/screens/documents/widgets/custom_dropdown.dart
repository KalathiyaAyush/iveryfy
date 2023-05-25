import 'package:flutter/material.dart';
import 'package:iverify/src/resources/color_manager.dart';
import 'package:iverify/src/resources/value_manager.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool all = false;
  bool verified = false;
  bool inProgress = false;
  bool rejected = false;

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
      child: Column(
        children: [
          Row(
            children: [
              CheckboxListTile(
                value: all,
                onChanged: (value) {
                  setState(() {
                    all = value!;
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
