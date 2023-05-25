import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/resources/routes_manager.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_textfield.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class AddConnectionScreen extends StatefulWidget {
  const AddConnectionScreen({super.key});

  @override
  State<AddConnectionScreen> createState() => _AddConnectionScreenState();
}

class _AddConnectionScreenState extends State<AddConnectionScreen> {
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController iverifyIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: ColorManager.scaffoldBg,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarWidget(onbackTap: () {
                  Navigator.of(context).pop();
                }),
                _textWidget(),
                SizedBox(height: AppHeight.h30),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Column(
                    children: [
                      AppTextField(
                        controller: emailAddressController,
                        labelText: AppStrings.kEmailAddress,
                      ),
                      SizedBox(height: AppHeight.h20),
                      Center(
                        child: Text(
                          AppStrings.kOr,
                          style: regularTextStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.hintTextColor,
                            fontFamily: FontConstants.quicksand,
                          ),
                        ),
                      ),
                      SizedBox(height: AppHeight.h20),
                      AppTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        labelText: AppStrings.kiVerifiID,
                        controller: iverifyIDController,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: AppElevatedButton(
                    onPressed: () {
                      AppRoutes.pushNamed(context,
                          name: AppRoutes.connectionAddedScreen);
                    },
                    child: Text(
                      AppStrings.kNext,
                      style: semiBoldTextStyle(
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
        );
      },
    );
  }

  Widget _textWidget() {
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.kAddNewConnection,
            style: mediumTextStyle(
              fontSize: FontSize.s24,
              color: ColorManager.titleTextColor,
              fontFamily: FontConstants.rubik,
            ),
          ),
          SizedBox(height: AppHeight.h3),
          Text(
            AppStrings.kAddConnectionDes,
            style: regularTextStyle(
              fontSize: FontSize.s13,
              color: ColorManager.titleTextColor,
              fontFamily: FontConstants.quicksand,
            ),
          ),
        ],
      ),
    );
  }
}
