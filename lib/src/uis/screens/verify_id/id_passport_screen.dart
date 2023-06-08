import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class IdPassportScreen extends StatelessWidget {
  const IdPassportScreen({super.key});

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
                  SizedBox(height: AppHeight.h15),
                  AppbarWidget(onbackTap: () {}),
                  SizedBox(height: AppHeight.h5),
                  _buildTextWidget(),
                  SizedBox(height: AppHeight.h30),
                  Container(
                    width: AppWidth.w320,
                    height: AppHeight.h280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.r20),
                      color: const Color.fromRGBO(217, 217, 217, 0.44),
                    ),
                  ),
                  const Spacer(),
                  AppElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.kTakePhoto,
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
          ),
        );
      },
    );
  }

  Widget _buildTextWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.kTakephotoofPassport,
          style: mediumTextStyle(
            fontSize: FontSize.s24,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.rubik,
          ),
        ),
        SizedBox(height: AppHeight.h5),
        Text(
          AppStrings.kidPassportDes,
          style: regularTextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.quicksand,
          ),
        ),
      ],
    );
  }
}
