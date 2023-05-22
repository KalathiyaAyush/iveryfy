import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class ConfirmPasscodeSignup extends StatefulWidget {
  const ConfirmPasscodeSignup({super.key});

  @override
  State<ConfirmPasscodeSignup> createState() => _ConfirmPasscodeSignupState();
}

class _ConfirmPasscodeSignupState extends State<ConfirmPasscodeSignup> {
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
              AppStrings.kConfirmPasscode,
              style: mediumTextStyle(
                fontSize: FontSize.s24,
                color: ColorManager.titleTextColor,
                fontFamily: FontConstants.rubik,
              ),
            ),
            SizedBox(height: AppHeight.h3),
            Text(
              AppStrings.kSetPasscodeDes,
              textAlign: TextAlign.center,
              style: regularTextStyle(
                fontSize: FontSize.s16,
                color: ColorManager.titleTextColor,
                fontFamily: FontConstants.quicksand,
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
                AppRoutes.pushNamed(
                  context,
                  name: AppRoutes.fingerBiometricScreen,
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
