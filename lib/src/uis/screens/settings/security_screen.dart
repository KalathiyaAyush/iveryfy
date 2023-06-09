import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/resources/assets_manager.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/screens/settings/widget/setting_view.dart';
import '/src/uis/screens/settings/widget/setting_switch_view.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

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
                  Navigator.of(context).pop();
                }),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Text(
                    AppStrings.kSecurity,
                    style: mediumTextStyle(
                      fontSize: FontSize.s24,
                      color: ColorManager.titleTextColor,
                      fontFamily: FontConstants.rubik,
                    ),
                  ),
                ),
                SizedBox(height: AppHeight.h10),
                const SettingView(
                  assetName: ImageAssets.security,
                  asset: ImageAssets.graterthanIcon,
                  title: AppStrings.kChangepin,
                ),
                SettingSwitchView(
                  assetName: ImageAssets.faceidIcon,
                  asset: '',
                  title: AppStrings.kFaceID,
                  value: true,
                  onToggle: (val) {},
                ),
                SettingSwitchView(
                  assetName: ImageAssets.fingerPrintSvgIcon,
                  asset: '',
                  title: AppStrings.kFingerprint,
                  value: true,
                  onToggle: (val) {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
