import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Providers/auth/auth_provider.dart';
import '../../../widgets/app_progress_indicator.dart';
import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/uis/widgets/app_title_text.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});


  void _googleLogin() async {
    final authProvoder = context.read<AuthProvider>();
    await authProvoder.signInWithGoogle();
    if (FirebaseAuth.instance.currentUser == null) return;
    AppProgressIndicator.show();
    final isSuccess = await authProvoder.postSignUp();
    AppProgressIndicator.dismiss();
    if (isSuccess) {
      _navigateLogic(
        completionLevel:
        authProvoder.postSignUpModel?.user?.profileCompletionLevel ?? 0,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppHeight.h40),
          const AppTitleText(
            title: AppStrings.kLogintoiverifi,
            titleDes: AppStrings.kLoginDescription,
          ),
          SizedBox(height: AppHeight.h40),
          Padding(
            padding:
                EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.kOTPless,
                  style: regularTextStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.textColor,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
                SizedBox(height: AppHeight.h15),
                Container(
                  height: AppHeight.h55,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: AppPadding.p12, right: AppPadding.p10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r15),
                    border: Border.all(color: ColorManager.primaryColor),
                  ),
                  child: Row(
                    children: [
                      Image.asset(ImageAssets.whatsappIcon,
                          height: AppHeight.h35),
                      SizedBox(width: AppWidth.w10),
                      Flexible(
                        child: Text(
                          AppStrings.kWhatsapp,
                          style: mediumTextStyle(
                            fontSize: FontSize.s17,
                            color: ColorManager.hintTextColor,
                            fontFamily: FontConstants.quicksand,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppHeight.h15),
          socialMediaContainer(
            AppStrings.kgoogle,
            ImageAssets.googleIcon,
            () {

              _googleLogin();
              // AppRoutes.pushNamed(
              //   context,
              //   name: AppRoutes.enterPasscodeScreen,
              // );
            },
          ),
          SizedBox(height: AppHeight.h30),
          Padding(
            padding:
                EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.kWeb3wallet,
                  style: regularTextStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.textColor,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
                SizedBox(height: AppHeight.h15),
                Container(
                  height: AppHeight.h55,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: AppPadding.p15, right: AppPadding.p10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r15),
                    border: Border.all(color: ColorManager.primaryColor),
                  ),
                  child: Row(
                    children: [
                      Image.asset(ImageAssets.metamaskIcon),
                      SizedBox(width: AppWidth.w10),
                      Text(
                        AppStrings.kMetamask,
                        style: mediumTextStyle(
                          fontSize: FontSize.s17,
                          color: ColorManager.hintTextColor,
                          fontFamily: FontConstants.quicksand,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget socialMediaContainer(
      String socialMedianame, String assetName, Function()? onTap) {
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
      child: Material(
        color: ColorManager.scaffoldBg,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.r15),
          onTap: onTap,
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: AppHeight.h55,
            width: double.infinity,
            padding:
                EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r15),
              border: Border.all(color: ColorManager.primaryColor),
            ),
            child: Row(
              children: [
                SvgPicture.asset(assetName),
                SizedBox(width: AppWidth.w10),
                Flexible(
                  child: Text(
                    socialMedianame,
                    style: mediumTextStyle(
                      fontSize: FontSize.s17,
                      color: ColorManager.hintTextColor,
                      fontFamily: FontConstants.quicksand,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
