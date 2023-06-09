import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class EnterPasscodeScreen extends StatefulWidget {
  const EnterPasscodeScreen({super.key});

  @override
  State<EnterPasscodeScreen> createState() => _EnterPasscodeScreenState();
}

class _EnterPasscodeScreenState extends State<EnterPasscodeScreen> {
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
        child: Column(
          children: [
            SizedBox(height: AppHeight.h50),
            Image.asset(ImageAssets.securityIcon),
            SizedBox(height: AppHeight.h15),
            Text(
              AppStrings.kEnteryourPasscode,
              style: mediumTextStyle(
                fontSize: FontSize.s24,
                color: ColorManager.titleTextColor,
                fontFamily: FontConstants.rubik,
              ),
            ),
            SizedBox(height: AppHeight.h20),
            Pinput(
              controller: _pinController,
              keyboardType: TextInputType.number,
              closeKeyboardWhenCompleted: true,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              defaultPinTheme: PinTheme(
                  textStyle: mediumTextStyle(
                    fontSize: FontSize.s24,
                    color: ColorManager.textColor,
                    fontFamily: FontConstants.rubik,
                  ),
                  width: AppWidth.w64,
                  height: AppHeight.h70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                  )),
            ),
            const Spacer(),
            AppElevatedButton(
              onPressed: () {
                AppRoutes.popUntil(
                  context,
                  name: AppRoutes.bottomNavigationScreen,
                );
              },
              child: Text(
                AppStrings.kcontinue,
                style: mediumTextStyle(
                  fontSize: FontSize.s17,
                  color: ColorManager.scaffoldBg,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ),
            SizedBox(height: AppHeight.h10),
            TextButton(
              onPressed: () {
                AppRoutes.pushNamed(
                  context,
                  name: AppRoutes.forgotPasscodeScreen,
                );
              },
              child: Text(
                AppStrings.kForgotPasscode,
                style: regularTextStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.hintTextColor,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ),
            SizedBox(height: AppHeight.h10),
          ],
        ),
      ),
    );
  }
}
