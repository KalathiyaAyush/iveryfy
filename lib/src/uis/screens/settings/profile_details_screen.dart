import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/uis/screens/settings/widget/custom_field.dart';

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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppHeight.h20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppbarWidget(
                    onbackTap: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset('lib/assets/svg/settings/edit.svg'),
                    onPressed: () {
                      AppRoutes.pushNamed(context,
                          name: AppRoutes.editProfileDetailScreen);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppPadding.p20, right: AppPadding.p20),
                    child: Text(
                      AppStrings.kProfileDetails,
                      style: mediumTextStyle(
                        fontSize: FontSize.s24,
                        color: ColorManager.titleTextColor,
                        fontFamily: FontConstants.rubik,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppHeight.h30),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
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
                    const CustomField(
                        labelText: AppStrings.kFirstName, initialValue: 'Josh'),
                    const CustomField(
                        labelText: AppStrings.kLastName, initialValue: '-'),
                    const CustomField(
                        labelText: AppStrings.kDateofBirth, initialValue: '-'),
                    const CustomField(
                        labelText: AppStrings.kNationality, initialValue: '-'),
                    const CustomField(
                        labelText: AppStrings.kPhoneNumber, initialValue: '-'),
                    const CustomField(
                        labelText: AppStrings.kEmailAddress,
                        initialValue: 'examplegmail.com'),
                    const CustomField(
                        labelText: AppStrings.kNIN, initialValue: '-'),
                    const CustomField(
                        labelText: AppStrings.kHomeAddress, initialValue: '-'),
                    SizedBox(height: AppHeight.h30),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
