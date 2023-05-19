import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppHeight.h10),
                    AppbarWidget(
                      onbackTap: () {
                        Navigator.of(context).pop();
                      },
                      icon:
                          SvgPicture.asset('lib/assets/svg/settings/edit.svg'),
                      onPressed: () {
                        AppRoutes.pushNamed(context,
                            name: AppRoutes.editProfileDetailScreen);
                      },
                    ),
                    Text(
                      AppStrings.kProfileDetails,
                      style: mediumTextStyle(
                        fontSize: FontSize.s24,
                        color: ColorManager.titleTextColor,
                        fontFamily: FontConstants.rubik,
                      ),
                    ),
                    SizedBox(height: AppHeight.h30),
                    Center(
                      child: Container(
                        height: AppHeight.h120,
                        width: AppWidth.w130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: AppWidth.w4,
                            color: ColorManager.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppHeight.h20),
                    TextField(
                      autofocus: true,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.kFirstName,
                        labelStyle: regularTextStyle(
                          color: ColorManager.buttonGreyText,
                          fontFamily: FontConstants.quicksand,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: AppHeight.h15),
                    TextField(
                      autofocus: true,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.kLastName,
                        labelStyle: regularTextStyle(
                          color: ColorManager.buttonGreyText,
                          fontFamily: FontConstants.quicksand,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: AppHeight.h15),
                    TextField(
                      autofocus: true,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.kDateofBirth,
                        labelStyle: regularTextStyle(
                          color: ColorManager.buttonGreyText,
                          fontFamily: FontConstants.quicksand,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: AppHeight.h15),
                    TextField(
                      autofocus: true,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.kNationality,
                        labelStyle: regularTextStyle(
                          color: ColorManager.buttonGreyText,
                          fontFamily: FontConstants.quicksand,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: AppHeight.h15),
                    TextField(
                      autofocus: true,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.kPhoneNumber,
                        labelStyle: regularTextStyle(
                          color: ColorManager.buttonGreyText,
                          fontFamily: FontConstants.quicksand,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: AppHeight.h15),
                    TextField(
                      autofocus: true,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.kEmailAddress,
                        labelStyle: regularTextStyle(
                          color: ColorManager.buttonGreyText,
                          fontFamily: FontConstants.quicksand,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: AppHeight.h15),
                    TextField(
                      autofocus: true,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.kNIN,
                        labelStyle: regularTextStyle(
                          color: ColorManager.buttonGreyText,
                          fontFamily: FontConstants.quicksand,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: AppHeight.h15),
                    TextField(
                      autofocus: true,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.kHomeAddress,
                        labelStyle: regularTextStyle(
                          color: ColorManager.buttonGreyText,
                          fontFamily: FontConstants.quicksand,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: AppHeight.h30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
