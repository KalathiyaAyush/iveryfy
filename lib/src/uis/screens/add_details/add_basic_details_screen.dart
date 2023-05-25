import 'package:flutter/material.dart';
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

class AddBasicDetailsScreen extends StatefulWidget {
  const AddBasicDetailsScreen({super.key});

  @override
  State<AddBasicDetailsScreen> createState() => _AddBasicDetailsScreenState();
}

class _AddBasicDetailsScreenState extends State<AddBasicDetailsScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateofBirthController = TextEditingController();
  final _nationalitynController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _ninController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: ColorManager.scaffoldBg,
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppHeight.h40),
                  const AppTitleText(
                    title: AppStrings.kAddBasicDetails,
                    titleDes: AppStrings.kAddBasicDetailsDes,
                  ),
                  SizedBox(height: AppHeight.h30),
                  Column(
                    children: [
                      AppTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        labelText: AppStrings.kFirstName,
                        controller: _firstNameController,
                      ),
                      SizedBox(height: AppHeight.h15),
                      AppTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        labelText: AppStrings.kLastName,
                        controller: _lastNameController,
                      ),
                      SizedBox(height: AppHeight.h15),
                      AppTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        labelText: AppStrings.kDateofBirth,
                        controller: _dateofBirthController,
                      ),
                      SizedBox(height: AppHeight.h15),
                      AppTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        labelText: AppStrings.kNationality,
                        controller: _nationalitynController,
                      ),
                      SizedBox(height: AppHeight.h15),
                      AppTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        labelText: AppStrings.kPhoneNumber,
                        controller: _phoneNumberController,
                      ),
                      SizedBox(height: AppHeight.h15),
                      AppTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        labelText: AppStrings.kNIN,
                        controller: _ninController,
                      ),
                    ],
                  ),
                  const Spacer(),
                  AppElevatedButton(
                    onPressed: () {
                      AppRoutes.popUntil(
                        context,
                        name: AppRoutes.homeAddressScreen,
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
