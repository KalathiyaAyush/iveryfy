import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iverify/src/resources/color_manager.dart';
import 'package:iverify/src/resources/font_manager.dart';
import 'package:iverify/src/resources/string_manager.dart';
import 'package:iverify/src/resources/style_manager.dart';
import 'package:iverify/src/resources/value_manager.dart';

class DocumentCard extends StatelessWidget {
  final String? assetName;
  final Function()? onTap;
  final List<Widget>? children;
  const DocumentCard(
      {super.key, required this.onTap, this.children, this.assetName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppHeight.h100,
        width: AppWidth.w330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r8),
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 0.2),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: AppHeight.h15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: AppWidth.w10),
                SvgPicture.asset('lib/assets/svg/pass_black.svg'),
                SizedBox(width: AppWidth.w10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.kPassport,
                      style: semiBoldTextStyle(
                        fontSize: FontSize.s20,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                    SizedBox(height: AppHeight.h3),
                    Wrap(
                      children: children ?? [],
                    ),
                  ],
                ),
                SizedBox(width: AppWidth.w180),
                SvgPicture.asset(assetName ?? ''),
              ],
            ),
            const Spacer(),
            Container(
              height: AppHeight.h40,
              width: AppWidth.w330,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.credCardColor,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppRadius.r8),
                  bottomRight: Radius.circular(AppRadius.r8),
                ),
                color: ColorManager.credCardColor,
              ),
              child: Row(
                children: [
                  SizedBox(width: AppWidth.w12),
                  Text(
                    'Verified on 12 Jun 2023',
                    style: regularTextStyle(
                      fontSize: FontSize.s16,
                      color: ColorManager.scaffoldBg,
                      fontFamily: FontConstants.quicksand,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
