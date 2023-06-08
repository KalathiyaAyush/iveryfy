import 'package:flutter/material.dart';
import 'package:iverify/src/uis/widgets/app_textfield.dart';
import 'package:iverify/src/uis/widgets/appbar_widget.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppHeight.h20),
          AppbarWidget(onbackTap: () {
            Navigator.of(context).pop();
          }),
          const AppTitleText(
            title: AppStrings.kForgotPasscode,
            titleDes: AppStrings.kResetMPINDes,
          ),
          SizedBox(height: AppHeight.h15),
          Padding(
            padding:
                EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
            child: Column(
              children: [
                AppTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  labelText: AppStrings.kEmailAddress,
                  controller: emailAddressController,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  labelText: AppStrings.kiVerifiID,
                  controller: iverifyIDController,
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: AppElevatedButton(
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
          ),
          SizedBox(height: AppHeight.h30),
        ],
      ),
    );
  }
}
