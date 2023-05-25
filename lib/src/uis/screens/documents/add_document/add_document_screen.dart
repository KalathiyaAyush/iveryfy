// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/resources/routes_manager.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_title_text.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({super.key});

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  bool selected = false;
  List<String> docList = [];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppHeight.h20),
              AppbarWidget(onbackTap: () {
                Navigator.of(context).pop();
              }),
              const AppTitleText(
                title: AppStrings.kAddNewDocuments,
                titleDes: AppStrings.kAddDocumentDes,
              ),
              SizedBox(height: AppHeight.h30),
              Column(
                children: [
                  _buildDocumentCard(
                    AppStrings.kPassport,
                    AppStrings.kAddPassportDetails,
                  ),
                  _buildDocumentCard(
                    AppStrings.kDriverLicense,
                    AppStrings.kAddDLDetails,
                  ),
                  _buildDocumentCard(
                    AppStrings.kProofofAddress,
                    AppStrings.kAddAddressDetail,
                  ),
                  _buildDocumentCard(
                    AppStrings.kRighttoWork,
                    AppStrings.kAddGovermentProof,
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: AppElevatedButton(
                  onPressed: () {
                    AppRoutes.pushNamed(context,
                        name: AppRoutes.documentAddedScreen);
                  },
                  child: Text(
                    AppStrings.kcontinue,
                    style: regularTextStyle(
                      fontSize: FontSize.s18,
                      color: ColorManager.scaffoldBg,
                      fontFamily: FontConstants.quicksand,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppHeight.h30),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDocumentCard(String title, String titleDes) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: AppPadding.p18, left: AppPadding.p20, right: AppPadding.p20),
      child: Container(
        width: double.infinity,
        height: AppHeight.h60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r6),
          border: Border.all(color: ColorManager.primaryColor),
        ),
        child: Row(
          children: [
            SizedBox(width: AppWidth.w10),
            SvgPicture.asset(
              'lib/assets/svg/pass.svg',
              height: AppHeight.h35,
              color: ColorManager.primaryColor,
            ),
            SizedBox(width: AppWidth.w10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: mediumTextStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.textColor,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
                Text(
                  titleDes,
                  style: regularTextStyle(
                    fontSize: FontSize.s13,
                    color: ColorManager.hintTextColor,
                    fontFamily: FontConstants.quicksand,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
