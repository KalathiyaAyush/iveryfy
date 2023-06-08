import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/app_elevatedbutton.dart';

class LoginPinScreen extends StatefulWidget {
  const LoginPinScreen({super.key});

  @override
  State<LoginPinScreen> createState() => _LoginPinScreenState();
}

class _LoginPinScreenState extends State<LoginPinScreen> {
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: ColorManager.scaffoldBg,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: AppHeight.h50),
                Center(
                  child: Image.asset('lib/assets/images/security.png'),
                ),
                SizedBox(height: AppHeight.h10),
                _buildTextWidget(),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p30,
                      right: AppPadding.p30,
                      top: AppPadding.p30),
                  child: Pinput(
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
                ),
                const Spacer(),
                AppElevatedButton(
                  onPressed: () {
                    AppRoutes.popUntil(
                      context,
                      name: AppRoutes.fingerBiometricScreen,
                    );
                  },
                  child: Text(
                    AppStrings.kNext,
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
        );
      },
    );
  }

  Widget _buildTextWidget() {
    return Column(
      children: [
        Text(
          AppStrings.kSetMPIN,
          style: mediumTextStyle(
            fontSize: FontSize.s22,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.rubik,
          ),
        ),
        SizedBox(height: AppHeight.h5),
        Text(
          AppStrings.kSetPinDes,
          textAlign: TextAlign.center,
          style: regularTextStyle(
            fontSize: FontSize.s18,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.quicksand,
          ),
        ),
      ],
    );
  }
}
