import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/font_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';

class SettingView extends StatelessWidget {
  final String asset;
  final String assetName;
  final String title;
  final Function()? onTap;
  const SettingView({
    super.key,
    required this.assetName,
    required this.asset,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppPadding.p20, right: AppPadding.p30, top: AppPadding.p12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: AppRadius.r23,
                      backgroundColor: ColorManager.scaffoldBg,
                      child: SvgPicture.asset(
                        assetName,
                        height: AppHeight.h20,
                      ),
                    ),
                  ),
                  SizedBox(width: AppWidth.w15),
                  Text(
                    title,
                    style: mediumTextStyle(
                      fontSize: FontSize.s16,
                      color: ColorManager.titleTextColor,
                      fontFamily: FontConstants.quicksand,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              asset,
              height: AppHeight.h13,
            ),
          ],
        ),
      ),
    );
  }
}
