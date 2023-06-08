import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';

class PassportScreen extends StatelessWidget {
  const PassportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppHeight.h20),
                  AppbarWidget(onbackTap: () {}),
                  _buildText(),
                  const Spacer(),
                  _buildPassportCard(
                    AppStrings.kUploadexistingFile,
                  ),
                  SizedBox(height: AppHeight.h13),
                  _buildPassportCard(
                    AppStrings.kTakephotoUsingCamera,
                  ),
                  SizedBox(height: AppHeight.h55),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.kPassport,
          style: mediumTextStyle(
            fontSize: FontSize.s24,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.rubik,
          ),
        ),
        Text(
          AppStrings.kSelectHowWouldyoulikeAddPhotoofPassport,
          style: regularTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.quicksand,
          ),
        ),
      ],
    );
  }

  Widget _buildPassportCard(String data) {
    return Center(
      child: Container(
        height: AppHeight.h55,
        width: AppWidth.w330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r6),
          border: Border.all(color: ColorManager.primaryColor),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: AppPadding.p12,
            right: AppPadding.p12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data,
                style: mediumTextStyle(
                  fontSize: FontSize.s18,
                  color: ColorManager.textColor,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
              SvgPicture.asset('lib/assets/svg/greater_than_arrow.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
