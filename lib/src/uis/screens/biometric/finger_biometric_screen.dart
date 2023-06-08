import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/app_title_text.dart';
import '/src/uis/widgets/app_textbutton.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class FingerBiometricScreen extends StatelessWidget {
  const FingerBiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: ColorManager.scaffoldBg,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppHeight.h40),
                const AppTitleText(
                  title: AppStrings.kSetupFingerprint,
                  titleDes: AppStrings.kSetupDes,
                ),
                const Spacer(),
                Stack(
                  fit: StackFit.loose,
                  alignment: AlignmentDirectional.center,
                  children: [
                    Center(child: Image.asset(ImageAssets.outsideIcon)),
                    Positioned(
                      child: LottieBuilder.asset(
                        ImageAssets.fingerPrintIcon,
                        height: AppHeight.h150,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: AppElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.kEnableFingerPrint,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.scaffoldBg,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppHeight.h5),
                Center(
                  child: AppTextButton(
                      onPressed: () {
                        AppRoutes.pushNamed(
                          context,
                          name: AppRoutes.faceBiometricScreen,
                        );
                      },
                      child: Text(
                        AppStrings.kSkipForNow,
                        style: regularTextStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.titleTextColor,
                          fontFamily: FontConstants.quicksand,
                        ),
                      )),
                ),
                SizedBox(height: AppHeight.h10),
              ],
            ),
          ),
        );
      },
    );
  }
}
