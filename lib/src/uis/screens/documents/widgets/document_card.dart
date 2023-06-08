import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iverify/src/resources/assets_manager.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

class DocumentCard extends StatelessWidget {
  final String? assetName;
  final Function()? onTap;
  final List<Widget>? children;
  const DocumentCard(
      {super.key, required this.onTap, this.children, this.assetName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(
              color: const Color.fromRGBO(0, 0, 0, 0.2),
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  blurRadius: 12,
                  offset: Offset(0, 4))
            ]),
        child: Material(
          borderRadius: BorderRadius.circular(AppRadius.r8),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.r8),
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppPadding.p15, horizontal: AppPadding.p15),
                    child: Row(
                      children: [
                        SvgPicture.asset(ImageAssets.passportIcon),
                        SizedBox(width: AppWidth.w8),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.kPassport,
                                style: semiBoldTextStyle(
                                  fontSize: FontSize.s18,
                                  color: ColorManager.textColor,
                                  fontFamily: FontConstants.quicksand,
                                ),
                              ),
                              Row(
                                children: children ?? [],
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(assetName ?? ''),
                      ],
                    ),
                  ),
                ),
                // const Spacer(),
                Container(
                  // height: AppHeight.h40,
                  width: double.infinity,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p15, vertical: AppPadding.p10),
                    child: Text(
                      'Verified on 12 Jun 2023',
                      style: regularTextStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.scaffoldBg,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
