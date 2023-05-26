import 'package:flutter/material.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/string_manager.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Josh',
                    style: mediumTextStyle(
                      fontSize: FontSize.s24,
                      color: ColorManager.titleTextColor,
                      fontFamily: FontConstants.rubik,
                    ),
                  ),
                  SizedBox(height: AppHeight.h5),
                  Text(
                    'Good Morning',
                    style: mediumTextStyle(
                      fontSize: FontSize.s13,
                      color: ColorManager.titleTextColor,
                      fontFamily: FontConstants.quicksand,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                child: Image.asset(ImageAssets.profilePicIcon),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCard(
                const Color.fromRGBO(8, 131, 149, 1),
                '06',
                AppStrings.kDocuments,
              ),
              _buildCard(
                const Color.fromRGBO(145, 127, 179, 1),
                '06',
                AppStrings.kConnections,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Color color, String number, String data) {
    return Container(
      height: AppHeight.h90,
      width: AppWidth.w150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r16),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: mediumTextStyle(
              fontSize: FontSize.s32,
              color: ColorManager.scaffoldBg,
              fontFamily: FontConstants.rubik,
            ),
          ),
          Flexible(
            child: Text(
              data,
              style: regularTextStyle(
                fontSize: FontSize.s18,
                color: ColorManager.scaffoldBg,
                fontFamily: FontConstants.quicksand,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
