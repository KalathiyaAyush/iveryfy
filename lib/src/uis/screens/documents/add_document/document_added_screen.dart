import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/resources/routes_manager.dart';
import 'package:iverify/src/uis/widgets/app_outlinedbutton.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class DocumentAddedScreen extends StatelessWidget {
  const DocumentAddedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset('lib/assets/images/verified.png'),
                  SizedBox(height: AppHeight.h25),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p20, right: AppPadding.p20),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.kAwesome,
                          style: mediumTextStyle(
                            fontSize: FontSize.s22,
                            color: ColorManager.titleTextColor,
                            fontFamily: FontConstants.rubik,
                          ),
                        ),
                        SizedBox(height: AppHeight.h8),
                        Text(
                          AppStrings.kVerifiedDes,
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
                      AppRoutes.popUntil(context,
                          name: AppRoutes.bottomNavigationScreen);
                    },
                    child: Text(
                      AppStrings.kGotoHome,
                      style: semiBoldTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.scaffoldBg,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ),
                  SizedBox(height: AppHeight.h10),
                  AppOutlinedButton(
                    onPressed: () {},
                    data: AppStrings.kAddAnotherDocument,
                  ),
                  SizedBox(height: AppHeight.h20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
