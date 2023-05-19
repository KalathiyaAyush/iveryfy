import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_title_text.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';
import '/src/uis/widgets/app_outlinedbutton.dart';

class PassportAddedScreen extends StatelessWidget {
  const PassportAddedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppHeight.h10),
                  AppbarWidget(onbackTap: () {}),
                  SizedBox(height: AppHeight.h5),
                  const AppTitleText(
                    title: AppStrings.kPassport,
                    titleDes: AppStrings.kdate,
                  ),
                  SizedBox(height: AppHeight.h30),
                  Container(
                    width: AppWidth.w320,
                    height: AppHeight.h280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.r20),
                      color: const Color.fromRGBO(217, 217, 217, 0.44),
                    ),
                  ),
                  SizedBox(height: AppHeight.h20),
                  Center(
                    child: Text(
                      AppStrings.kIsthisPhotoClearenough,
                      style: regularTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.titleTextColor,
                        fontFamily: FontConstants.rubik,
                      ),
                    ),
                  ),
                  const Spacer(),
                  AppElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.kVerify,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.scaffoldBg,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ),
                  SizedBox(height: AppHeight.h10),
                  AppOutlinedButton(
                    onPressed: () {},
                    data: AppStrings.kRetake,
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
