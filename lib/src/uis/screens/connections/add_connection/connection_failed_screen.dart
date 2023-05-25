import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/resources/assets_manager.dart';
import 'package:iverify/src/resources/routes_manager.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/app_elevatedbutton.dart';

class ConnectionFailedScreen extends StatelessWidget {
  const ConnectionFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: ColorManager.scaffoldBg,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(ImageAssets.connectionFailedIcon),
                  SizedBox(height: AppHeight.h20),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p15, right: AppPadding.p15),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.kerror,
                          style: mediumTextStyle(
                            fontSize: FontSize.s20,
                            color: ColorManager.titleTextColor,
                            fontFamily: FontConstants.rubik,
                          ),
                        ),
                        SizedBox(height: AppHeight.h5),
                        Text(
                          AppStrings.kConnectionFailed,
                          textAlign: TextAlign.center,
                          style: regularTextStyle(
                            fontSize: FontSize.s18,
                            color: ColorManager.titleTextColor,
                            fontFamily: FontConstants.quicksand,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  AppElevatedButton(
                    onPressed: () {
                      AppRoutes.pushNamed(context,
                          name: AppRoutes.shareDocumentScreen);
                    },
                    child: Text(
                      AppStrings.kRetry,
                      style: semiBoldTextStyle(
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
          ),
        );
      },
    );
  }
}
