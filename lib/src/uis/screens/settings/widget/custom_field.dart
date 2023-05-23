import 'package:flutter/material.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/style_manager.dart';

class CustomField extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  const CustomField(
      {super.key, required this.labelText, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppPadding.p20, right: AppPadding.p20, bottom: AppPadding.p12),
      child: TextFormField(
        initialValue: initialValue,
        enabled: false,
        style: mediumTextStyle(
          fontSize: FontSize.s16,
          color: ColorManager.textColor,
          fontFamily: FontConstants.quicksand,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: regularTextStyle(
            color: ColorManager.buttonGreyText,
            fontFamily: FontConstants.quicksand,
            fontSize: FontSize.s16,
          ),
        ),
      ),
    );
  }
}
