import 'package:flutter/material.dart';

import '/src/resources/color_manager.dart';
import '/src/resources/font_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';

class AppTitleText extends StatelessWidget {
  final String title;
  final String titleDes;
  const AppTitleText({super.key, required this.title, required this.titleDes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: mediumTextStyle(
              fontSize: FontSize.s24,
              color: ColorManager.titleTextColor,
              fontFamily: FontConstants.rubik,
            ),
          ),
          SizedBox(height: AppHeight.h5),
          Text(
            titleDes,
            style: regularTextStyle(
              fontSize: FontSize.s13,
              color: ColorManager.titleTextColor,
              fontFamily: FontConstants.quicksand,
            ),
          ),
        ],
      ),
    );
  }
}
