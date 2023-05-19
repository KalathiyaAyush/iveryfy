import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iverify/src/uis/widgets/app_textfield.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/app_title_text.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class ForgotPasscodeScreen extends StatefulWidget {
  const ForgotPasscodeScreen({super.key});

  @override
  State<ForgotPasscodeScreen> createState() => _ForgotPasscodeScreenState();
}

class _ForgotPasscodeScreenState extends State<ForgotPasscodeScreen> {
  bool _btnEnabled = false;

  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController iverifyIDController = TextEditingController();

  void _backTap(BuildContext ctx) {
    AppRoutes.popUntil(
      context,
      name: AppRoutes.enterPasscodeScreen,
    );
  }

  @override
  void initState() {
    super.initState();
    emailAddressController.addListener(() {
      setState(() {
        _btnEnabled = emailAddressController.text.isNotEmpty;
      });
    });
    iverifyIDController.addListener(() {
      setState(() {
        _btnEnabled = iverifyIDController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppHeight.h40),
            GestureDetector(
              onTap: () => _backTap(context),
              child: SvgPicture.asset(
                'lib/assets/svg/back_arrow.svg',
              ),
            ),
            SizedBox(height: AppHeight.h20),
            const AppTitleText(
              title: AppStrings.kForgotPasscode,
              titleDes: AppStrings.kResetMPINDes,
            ),
            SizedBox(height: AppHeight.h15),
            AppTextField(
              style: regularTextStyle(
                fontSize: FontSize.s16,
                color: ColorManager.textColor,
                fontFamily: FontConstants.quicksand,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              labelText: AppStrings.kEmailAddress,
              controller: emailAddressController,
              labelStyle: regularTextStyle(
                color: ColorManager.buttonGreyText,
                fontFamily: FontConstants.quicksand,
                fontSize: FontSize.s20,
              ),
            ),
            SizedBox(height: AppHeight.h20),
            Center(
              child: Text(
                AppStrings.kOr,
                style: regularTextStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.hintTextColor,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ),
            SizedBox(height: AppHeight.h20),
            AppTextField(
              style: regularTextStyle(
                fontSize: FontSize.s16,
                color: ColorManager.textColor,
                fontFamily: FontConstants.quicksand,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              labelText: AppStrings.kiVerifiID,
              controller: iverifyIDController,
              labelStyle: regularTextStyle(
                color: ColorManager.buttonGreyText,
                fontFamily: FontConstants.quicksand,
                fontSize: FontSize.s20,
              ),
            ),
            const Spacer(),
            AppElevatedButton(
              onPressed: _btnEnabled
                  ? () {
                      AppRoutes.pushNamed(
                        context,
                        name: AppRoutes.setPasscodeScreen,
                      );
                    }
                  : null,
              child: Text(
                AppStrings.kcontinue,
                style: mediumTextStyle(
                  fontSize: FontSize.s16,
                  color: _btnEnabled
                      ? ColorManager.scaffoldBg
                      : ColorManager.buttonGreyText,
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
