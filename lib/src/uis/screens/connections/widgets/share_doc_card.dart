import 'package:flutter/material.dart';

import '/src/resources/color_manager.dart';
import '/src/resources/font_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';

class ShareDocCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function(bool?) onChange;
  const ShareDocCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppRadius.r10),
      child: InkWell(
        onTap: () {
          onChange(!isSelected);
        },
        splashColor: ColorManager.primaryColor,
        child: Center(
          child: Container(
            width: AppWidth.w330,
            height: AppHeight.h52,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.primaryColor),
              borderRadius: BorderRadius.circular(AppRadius.r6),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  activeColor: ColorManager.secondaryColor,
                  side: BorderSide(
                    width: AppWidth.w1_1,
                    color: ColorManager.primaryColor,
                  ),
                  value: isSelected,
                  onChanged: onChange,
                ),
              ),
              title: Text(
                title,
                style: mediumTextStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.titleTextColor,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
