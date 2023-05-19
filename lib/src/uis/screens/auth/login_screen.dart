// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/app_textfield.dart';
import '/src/uis/widgets/app_title_text.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = false;
  void _toggleButton() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppHeight.h50),
                    const AppTitleText(
                      title: AppStrings.kWelcometoIverifi,
                      titleDes: AppStrings.kWelcomeDesc,
                    ),
                    SizedBox(height: AppHeight.h30),
                    AppTextField(
                      style: regularTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Please enter email address';
                        }
                        if (email.contains('@')) {
                          return 'Incorrect email address';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      labelText: AppStrings.kEmailAddress,
                      controller: emailAddressController,
                      labelStyle: regularTextStyle(
                        color: ColorManager.buttonGreyText,
                        fontFamily: FontConstants.quicksand,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    SizedBox(height: AppHeight.h20),
                    AppTextField(
                      style: regularTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'Please enter password';
                        } else {
                          return null;
                        }
                      },
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: AppPadding.p15),
                        child: GestureDetector(
                            onTap: _toggleButton,
                            child: Text(
                              _obscureText
                                  ? AppStrings.kHIDE
                                  : AppStrings.kHIDE,
                              style: mediumTextStyle(
                                fontSize: FontSize.s14,
                                color: ColorManager.floatingBtnColor,
                                fontFamily: FontConstants.quicksand,
                              ),
                            )),
                      ),
                      obscureText: !_obscureText,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      labelText: AppStrings.kpassword,
                      controller: passwordController,
                      labelStyle: regularTextStyle(
                        color: ColorManager.buttonGreyText,
                        fontFamily: FontConstants.quicksand,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    SizedBox(height: AppHeight.h40),
                    Column(
                      children: [
                        Text(
                          AppStrings.kOrContinueWith,
                          style: regularTextStyle(
                            fontSize: FontSize.s14,
                            color: ColorManager.textColor,
                            fontFamily: FontConstants.quicksand,
                          ),
                        ),
                        socialMediaIcon(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: AppPadding.p30,
                left: AppPadding.p22,
                right: AppPadding.p22),
            child: AppElevatedButton(
              onPressed: () {
                _formKey.currentState?.validate();
                AppRoutes.popUntil(
                  context,
                  name: AppRoutes.verifyEmailScreen,
                );
              },
              child: Text(
                AppStrings.kcontinue,
                style: mediumTextStyle(
                  fontSize: FontSize.s18,
                  color: ColorManager.scaffoldBg,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget socialMediaIcon() {
    return Padding(
      padding: EdgeInsets.only(
          left: AppPadding.p10, right: AppPadding.p10, top: AppPadding.p25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: AppHeight.h60,
            width: AppWidth.w130,
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.primaryColor),
              borderRadius: BorderRadius.circular(AppRadius.r15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('lib/assets/svg/google.svg'),
                SizedBox(width: AppWidth.w10),
                Text(
                  AppStrings.kgoogle,
                  style: mediumTextStyle(
                    fontSize: FontSize.s18,
                    color: ColorManager.buttonGreyText,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: AppHeight.h60,
            width: AppWidth.w130,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(67, 104, 199, 1),
              borderRadius: BorderRadius.circular(AppRadius.r15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('lib/assets/svg/facebook.svg'),
                SizedBox(width: AppWidth.w10),
                Text(
                  AppStrings.kfacebook,
                  style: mediumTextStyle(
                    fontSize: FontSize.s18,
                    color: ColorManager.scaffoldBg,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
