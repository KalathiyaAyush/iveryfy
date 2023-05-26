import 'package:flutter/material.dart';

import '/src/resources/color_manager.dart';
import '/src/resources/font_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';

class NameContainer extends StatelessWidget {
  final String name;
  final String email;
  const NameContainer({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppWidth.w330,
          height: AppHeight.h55,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.primaryColor),
            borderRadius: BorderRadius.circular(AppRadius.r6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppHeight.h3),
              Flexible(
                child: TextFormField(
                  initialValue: name,
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: AppStrings.kName,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: AppPadding.p8, horizontal: AppPadding.p10)),
                  style: mediumTextStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.textColor,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppHeight.h15),
        Container(
          width: AppWidth.w330,
          height: AppHeight.h55,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.primaryColor),
            borderRadius: BorderRadius.circular(AppRadius.r6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppHeight.h3),
              Flexible(
                child: TextFormField(
                  initialValue: email,
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: AppStrings.kEmailAddress,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: AppPadding.p8, horizontal: AppPadding.p10)),
                  style: mediumTextStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.textColor,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
