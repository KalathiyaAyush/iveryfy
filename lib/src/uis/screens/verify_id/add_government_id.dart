import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_title_text.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class AddGovernmentId extends StatelessWidget {
  const AddGovernmentId({super.key});

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
                  SizedBox(height: AppHeight.h5),
                  const AppTitleText(
                    title: AppStrings.kAddGovernmentID,
                    titleDes: AppStrings.kAddGovermentIDDes,
                  ),
                  SizedBox(height: AppHeight.h30),
                  _buildCredentialCard(
                    AppStrings.kPassport,
                    AppStrings.kAddPassportDetails,
                  ),
                  SizedBox(height: AppHeight.h15),
                  _buildCredentialCard(
                    AppStrings.kDriverLicense,
                    AppStrings.kAddDLDetails,
                  ),
                  const Spacer(),
                  AppElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.kcontinue,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.scaffoldBg,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ),
                  SizedBox(height: AppHeight.h30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCredentialCard(String title, String titleDes) {
    return Container(
      width: AppWidth.w335,
      height: AppHeight.h60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r12),
        border: Border.all(color: ColorManager.primaryColor),
      ),
      child: Row(
        children: [
          SizedBox(width: AppWidth.w10),
          SvgPicture.asset(
            'lib/assets/svg/pass.svg',
            height: AppHeight.h35,
          ),
          SizedBox(width: AppWidth.w10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: mediumTextStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.textColor,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
              Text(
                titleDes,
                style: regularTextStyle(
                  fontSize: FontSize.s14,
                  color: ColorManager.hintTextColor,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
