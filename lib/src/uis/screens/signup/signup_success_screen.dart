import 'package:flutter/material.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(ImageAssets.emailVerifiedIcon),
            Text(
              AppStrings.kAwesome,
              style: mediumTextStyle(
                fontSize: FontSize.s20,
                color: ColorManager.titleTextColor,
                fontFamily: FontConstants.rubik,
              ),
            ),
            Text(
              AppStrings.kSignupSuccessDes,
              style: regularTextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.titleTextColor,
                fontFamily: FontConstants.quicksand,
              ),
            ),
            const Spacer(),
            AppElevatedButton(
              onPressed: () {
                AppRoutes.pushNamed(
                  context,
                  name: AppRoutes.enterYourPasscodeScreen,
                );
              },
              child: Text(
                AppStrings.kNext,
                style: mediumTextStyle(
                  fontSize: FontSize.s17,
                  color: ColorManager.scaffoldBg,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ),
            SizedBox(height: AppHeight.h30),
          ],
        ),
      ),
    );
  }
}
