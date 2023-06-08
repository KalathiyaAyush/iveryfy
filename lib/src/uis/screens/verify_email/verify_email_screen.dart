import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/resources/routes_manager.dart';

import '/src/uis/widgets/app_elevatedbutton.dart';
import '/src/uis/widgets/app_outlinedbutton.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Image.asset('lib/assets/images/email.png'),
              ),
              SizedBox(height: AppHeight.h20),
              _buildTextWidget(),
              const Spacer(),
              AppElevatedButton(
                onPressed: () {},
                child: Text(
                  AppStrings.kOpenEmail,
                  style: mediumTextStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.scaffoldBg,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
              ),
              SizedBox(height: AppHeight.h12),
              AppOutlinedButton(
                onPressed: () {
                  AppRoutes.popUntil(
                    context,
                    name: AppRoutes.verifiedEmailScreen,
                  );
                },
                data: AppStrings.kdidntReceiveEmail,
              ),
              SizedBox(height: AppHeight.h20),
            ],
          )),
        );
      },
    );
  }

  Widget _buildTextWidget() {
    return Column(
      children: [
        Text(
          AppStrings.kCheckYourEmail,
          style: mediumTextStyle(
            fontSize: FontSize.s22,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.rubik,
          ),
        ),
        SizedBox(height: AppHeight.h5),
        Text(
          AppStrings.kCheckEmailDes,
          textAlign: TextAlign.center,
          style: regularTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.rubik,
          ),
        ),
      ],
    );
  }
}
