import 'package:flutter/material.dart';
import 'package:iverify/src/resources/font_manager.dart';
import 'package:iverify/src/resources/style_manager.dart';

import '/src/resources/color_manager.dart';
import '/src/resources/value_manager.dart';

class AppOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String data;
  const AppOutlinedButton(
      {super.key, required this.onPressed, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          height: AppHeight.h45,
          width: AppWidth.w90Percent,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.buttonGreyText),
            borderRadius: BorderRadius.circular(AppRadius.r6),
          ),
          child: Center(
            child: Text(
              data,
              style: regularTextStyle(
                fontSize: FontSize.s18,
                color: ColorManager.buttonGreyText,
                fontFamily: FontConstants.quicksand,
              ),
            ),
          ),
        ));
  }
}
