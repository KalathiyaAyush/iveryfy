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
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
      child: Column(
        children: [
          Container(
            width: AppWidth.w330,
            height: AppHeight.h55,
            padding: EdgeInsets.only(left: AppPadding.p12, top: AppPadding.p10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.primaryColor),
              borderRadius: BorderRadius.circular(AppRadius.r6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.kName,
                  style: regularTextStyle(
                    fontSize: FontSize.s13,
                    color: ColorManager.hintTextColor,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
                SizedBox(height: AppHeight.h3),
                Flexible(
                  child: Text(
                    name,
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
            padding: EdgeInsets.only(left: AppPadding.p12, top: AppPadding.p10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.primaryColor),
              borderRadius: BorderRadius.circular(AppRadius.r6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.kEmailAddress,
                  style: regularTextStyle(
                    fontSize: FontSize.s13,
                    color: ColorManager.hintTextColor,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
                SizedBox(height: AppHeight.h3),
                Flexible(
                  child: Text(
                    email,
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
      ),
    );
  }
}
