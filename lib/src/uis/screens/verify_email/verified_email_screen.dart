import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/app_elevatedbutton.dart';

class VerifiedEmailScreen extends StatelessWidget {
  const VerifiedEmailScreen({super.key});

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
                  child: Image.asset('lib/assets/images/email_verified.png'),
                ),
                SizedBox(height: AppHeight.h15),
                _buildTextWidget(),
                const Spacer(),
                AppElevatedButton(
                  onPressed: () {},
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
          AppStrings.kEmailVerified,
          style: mediumTextStyle(
            fontSize: FontSize.s22,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.rubik,
          ),
        ),
        SizedBox(height: AppHeight.h5),
        Text(
          AppStrings.kEmailVerifiedDes,
          textAlign: TextAlign.center,
          style: regularTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.rubik,
          ),
        ),
      ],
    );
  }
}
