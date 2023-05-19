import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iverify/src/resources/routes_manager.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/uis/widgets/app_title_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppHeight.h40),
            const AppTitleText(
              title: AppStrings.kSignuptoiverifi,
              titleDes: AppStrings.kSignupDescription,
            ),
            SizedBox(height: AppHeight.h40),
            Text(
              AppStrings.kOTPless,
              style: regularTextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.textColor,
                fontFamily: FontConstants.quicksand,
              ),
            ),
            SizedBox(height: AppHeight.h15),
            Container(
              height: AppHeight.h58,
              width: AppWidth.w310,
              padding:
                  EdgeInsets.only(left: AppPadding.p15, right: AppPadding.p10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.r15),
                border: Border.all(color: ColorManager.primaryColor),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('lib/assets/svg/whatsapp.svg',
                      height: AppHeight.h25),
                  SizedBox(width: AppWidth.w10),
                  Text(
                    AppStrings.kWhatsapp,
                    style: mediumTextStyle(
                      fontSize: FontSize.s17,
                      color: ColorManager.hintTextColor,
                      fontFamily: FontConstants.quicksand,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppHeight.h15),
            socialMediaContainer(
              AppStrings.kgoogle,
              'lib/assets/svg/google.svg',
              () {
                AppRoutes.pushNamed(
                  context,
                  name: AppRoutes.signupSuccessScreen,
                );
              },
            ),
            SizedBox(height: AppHeight.h30),
            Text(
              AppStrings.kWeb3wallet,
              style: regularTextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.textColor,
                fontFamily: FontConstants.quicksand,
              ),
            ),
            SizedBox(height: AppHeight.h15),
            Container(
              height: AppHeight.h58,
              width: AppWidth.w310,
              padding:
                  EdgeInsets.only(left: AppPadding.p15, right: AppPadding.p10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.r15),
                border: Border.all(color: ColorManager.primaryColor),
              ),
              child: Row(
                children: [
                  Image.asset('lib/assets/images/metamask.png'),
                  SizedBox(width: AppWidth.w10),
                  Text(
                    AppStrings.kMetamask,
                    style: mediumTextStyle(
                      fontSize: FontSize.s17,
                      color: ColorManager.hintTextColor,
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

  Widget socialMediaContainer(
      String socialMedianame, String assetName, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppHeight.h58,
        width: AppWidth.w310,
        padding: EdgeInsets.only(left: AppPadding.p15, right: AppPadding.p10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r15),
          border: Border.all(color: ColorManager.primaryColor),
        ),
        child: Row(
          children: [
            SvgPicture.asset(assetName),
            SizedBox(width: AppWidth.w10),
            Text(
              socialMedianame,
              style: mediumTextStyle(
                fontSize: FontSize.s17,
                color: ColorManager.hintTextColor,
                fontFamily: FontConstants.quicksand,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
