import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class VerifyIdScreen extends StatelessWidget {
  const VerifyIdScreen({super.key});

  void _backTap(BuildContext ctx) {
    AppRoutes.popUntil(
      ctx,
      name: AppRoutes.addProfilePhotoScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarWidget(onbackTap: () {
                  _backTap(context);
                }),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Text(
                    AppStrings.kVerifyIdDes,
                    style: mediumTextStyle(
                      fontSize: FontSize.s25,
                      color: ColorManager.titleTextColor,
                      fontFamily: FontConstants.rubik,
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.verifyIDIcon,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppPadding.p20, right: AppPadding.p20),
                      child: Column(
                        children: [
                          Text(
                            AppStrings.kletsStartEKYC,
                            textAlign: TextAlign.center,
                            style: mediumTextStyle(
                              fontSize: FontSize.s20,
                              color: ColorManager.titleTextColor,
                              fontFamily: FontConstants.rubik,
                            ),
                          ),
                          SizedBox(height: AppHeight.h3),
                          Text(
                            AppStrings.kletsStartEKYCdes,
                            textAlign: TextAlign.center,
                            style: regularTextStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.titleTextColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: AppPadding.p30),
                    child: AppElevatedButton(
                      onPressed: () {
                        AppRoutes.pushNamed(
                          context,
                          name: AppRoutes.documentUploadedScreen,
                        );
                      },
                      child: Text(
                        AppStrings.kcontinue,
                        style: mediumTextStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.scaffoldBg,
                          fontFamily: FontConstants.quicksand,
                        ),
                      ),
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
}
