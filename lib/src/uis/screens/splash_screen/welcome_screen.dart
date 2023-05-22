import 'package:flutter/material.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/resources/assets_manager.dart';

import '/src/uis/widgets/app_elevatedbutton.dart';
import '/src/uis/widgets/app_outlinedbutton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(ImageAssets.welcomeIcon),
            SizedBox(height: AppHeight.h20),
            Column(
              children: [
                Text(
                  AppStrings.kWelcometoIverifi,
                  style: mediumTextStyle(
                    fontSize: FontSize.s22,
                    color: ColorManager.titleTextColor,
                    fontFamily: FontConstants.rubik,
                  ),
                ),
                SizedBox(height: AppHeight.h5),
                Text(
                  AppStrings.kWelcomeDes,
                  textAlign: TextAlign.center,
                  style: regularTextStyle(
                    fontSize: FontSize.s15,
                    color: ColorManager.titleTextColor,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                AppElevatedButton(
                  onPressed: () {
                    AppRoutes.pushNamed(
                      context,
                      name: AppRoutes.loginScreen,
                    );
                  },
                  child: Text(
                    AppStrings.kLogin,
                    style: mediumTextStyle(
                      fontSize: FontSize.s18,
                      color: ColorManager.scaffoldBg,
                      fontFamily: FontConstants.quicksand,
                    ),
                  ),
                ),
                SizedBox(height: AppHeight.h10),
                AppOutlinedButton(
                  onPressed: () {
                    AppRoutes.pushNamed(
                      context,
                      name: AppRoutes.signupScreen,
                    );
                  },
                  data: AppStrings.kSignup,
                ),
                SizedBox(height: AppHeight.h30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
