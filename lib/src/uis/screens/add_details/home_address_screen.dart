import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/app_textfield.dart';
import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_title_text.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class HomeAddressScreen extends StatefulWidget {
  const HomeAddressScreen({super.key});

  @override
  State<HomeAddressScreen> createState() => _HomeAddressScreenState();
}

class _HomeAddressScreenState extends State<HomeAddressScreen> {
  final _homeAddressLine1ontroller = TextEditingController();
  final _homeAddressLine2ontroller = TextEditingController();
  final _cityController = TextEditingController();
  final _postcodeController = TextEditingController();
  final _countryRegionController = TextEditingController();

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
                  SizedBox(height: AppHeight.h10),
                  const AppTitleText(
                    title: AppStrings.kHomeAddress,
                    titleDes: AppStrings.kHomeAddressDes,
                  ),
                  SizedBox(height: AppHeight.h30),
                  Center(
                    child: Column(
                      children: [
                        AppTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          labelText: AppStrings.kHomeaddressline2,
                          controller: _homeAddressLine1ontroller,
                        ),
                        SizedBox(height: AppHeight.h15),
                        AppTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          labelText: AppStrings.kHomeaddressline2,
                          controller: _homeAddressLine2ontroller,
                        ),
                        SizedBox(height: AppHeight.h15),
                        AppTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          labelText: AppStrings.kCity,
                          controller: _cityController,
                        ),
                        SizedBox(height: AppHeight.h15),
                        AppTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          labelText: AppStrings.kPostcode,
                          controller: _postcodeController,
                        ),
                        SizedBox(height: AppHeight.h15),
                        AppTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          labelText: AppStrings.kCountryRegion,
                          controller: _countryRegionController,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: AppElevatedButton(
                      onPressed: () {
                        AppRoutes.popUntil(
                          context,
                          name: AppRoutes.addProfilePhotoScreen,
                        );
                      },
                      child: Text(
                        AppStrings.kNext,
                        style: mediumTextStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.scaffoldBg,
                          fontFamily: FontConstants.quicksand,
                        ),
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
}
