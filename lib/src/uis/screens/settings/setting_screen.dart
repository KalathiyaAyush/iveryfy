import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/resources/assets_manager.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/resources/routes_manager.dart';
import '/src/uis/screens/settings/widget/setting_view.dart';
import '/src/uis/screens/settings/widget/setting_switch_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  final String id = 'xxxxxxxxxxxxxx1254';

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppHeight.h70),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.kSettings,
                        style: mediumTextStyle(
                          fontSize: FontSize.s26,
                          color: ColorManager.titleTextColor,
                          fontFamily: FontConstants.rubik,
                        ),
                      ),
                      SizedBox(height: AppHeight.h20),
                      Container(
                        width: AppWidth.w330,
                        padding: EdgeInsets.only(left: AppPadding.p12),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorManager.primaryColor),
                          borderRadius: BorderRadius.circular(AppRadius.r6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.kiVerifiID,
                                    style: regularTextStyle(
                                      fontSize: FontSize.s14,
                                      color: ColorManager.hintTextColor,
                                      fontFamily: FontConstants.quicksand,
                                    ),
                                  ),
                                  Text(
                                    id,
                                    style: mediumTextStyle(
                                      fontSize: FontSize.s18,
                                      color: ColorManager.textColor,
                                      fontFamily: FontConstants.quicksand,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                    ClipboardData(text: id));
                              },
                              icon: const Icon(
                                Icons.copy,
                                color: ColorManager.hintTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppHeight.h15),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SettingView(
                        assetName: ImageAssets.profileIcon,
                        asset: ImageAssets.graterthanIcon,
                        title: AppStrings.kProfile,
                        onTap: () {
                          AppRoutes.pushNamed(context,
                              name: AppRoutes.profileDetailScreen);
                        },
                      ),
                      SettingSwitchView(
                        assetName: ImageAssets.notificationIcon,
                        asset: '',
                        title: AppStrings.kNotification,
                        value: true,
                        onToggle: (val) {},
                      ),
                      SettingView(
                        assetName: ImageAssets.security,
                        asset: ImageAssets.graterthanIcon,
                        title: AppStrings.kSecurity,
                        onTap: () {
                          AppRoutes.pushNamed(context,
                              name: AppRoutes.securityScreen);
                        },
                      ),
                      SettingView(
                        assetName: ImageAssets.iverifiIDIcon,
                        asset: ImageAssets.graterthanIcon,
                        title: AppStrings.kYouriVerifiID,
                        onTap: () {
                          AppRoutes.pushNamed(context,
                              name: AppRoutes.iVerifiIDScreen);
                        },
                      ),
                      const SettingView(
                        assetName: ImageAssets.accRecoveryIcon,
                        asset: ImageAssets.graterthanIcon,
                        title: AppStrings.kAccountRecoveryPhrase,
                      ),
                      const SettingView(
                        assetName: ImageAssets.paymentIcon,
                        asset: ImageAssets.graterthanIcon,
                        title: AppStrings.kPaymentMethod,
                      ),
                      const SettingView(
                        assetName: ImageAssets.privacyIcon,
                        asset: ImageAssets.graterthanIcon,
                        title: AppStrings.kPrivacyPolicy,
                      ),
                      const SettingView(
                        assetName: ImageAssets.termsOfService,
                        asset: ImageAssets.graterthanIcon,
                        title: AppStrings.kTermsofService,
                      ),
                      const SettingView(
                        assetName: ImageAssets.deleteSvgIcon,
                        asset: ImageAssets.graterthanIcon,
                        title: AppStrings.kDeleteAccount,
                      ),
                      const SettingView(
                        assetName: ImageAssets.logoutIcon,
                        asset: '',
                        title: AppStrings.kLogout,
                      ),
                      SizedBox(height: AppHeight.h65),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Neumorphic(
//   style: NeumorphicStyle(

//     shape: NeumorphicShape.concave,
//     boxShape: NeumorphicBoxShape.roundRect(
//         BorderRadius.circular(12)),
//     depth: 100,
//     lightSource: LightSource.topLeft,
//     color: ColorManager.secondaryColor,
//   ),
//   child: Text(AppStrings.kNext),
// ),
// Container(
//   height: 50,
//   width: 50,
//   padding: EdgeInsets.all(8),
//   child: SvgPicture.asset(
//     "lib/assets/svg/greater_than_arrow.svg",
//   ),
//   decoration: BoxDecoration(
//       color: ColorManager.scaffoldBg,
//       borderRadius: BorderRadius.circular(AppRadius.r80),
//       boxShadow: const [
//         BoxShadow(
//           color: Color(0xFFBEBEBE),
//           offset: Offset(15, 15),
//           blurRadius: 60,
//           spreadRadius: 5,
//         ),
//         BoxShadow(
//           color: Colors.white,
//           offset: Offset(5, 5),
//           blurRadius: 60,
//           spreadRadius: 5,
//         ),
//       ]),
// ),
