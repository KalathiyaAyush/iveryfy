import 'package:flutter/material.dart';
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

class ShareDocumentScreen extends StatefulWidget {
  const ShareDocumentScreen({super.key});

  @override
  State<ShareDocumentScreen> createState() => _ShareDocumentScreenState();
}

class _ShareDocumentScreenState extends State<ShareDocumentScreen> {
  bool passport = false;
  bool dlicence = false;
  bool addProof = false;
  bool righttoWork = false;

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
                const AppTitleText(
                  title: AppStrings.kShareDocuments,
                  titleDes: AppStrings.kShareDocumentsDes,
                ),
                SizedBox(height: AppHeight.h20),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorManager.primaryColor),
                            borderRadius: BorderRadius.circular(AppRadius.r6)),
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: ColorManager.secondaryColor,
                          side: const BorderSide(
                              color: ColorManager.primaryColor),
                          title: Text(
                            AppStrings.kPassport,
                            style: mediumTextStyle(
                              color: ColorManager.titleTextColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                          ),
                          value: passport,
                          onChanged: (value) {
                            setState(() {
                              passport = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: AppHeight.h15),
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorManager.primaryColor),
                            borderRadius: BorderRadius.circular(AppRadius.r6)),
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: ColorManager.secondaryColor,
                          side: const BorderSide(
                              color: ColorManager.primaryColor),
                          title: Text(
                            AppStrings.kDriverLicense,
                            style: mediumTextStyle(
                              color: ColorManager.titleTextColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                          ),
                          value: dlicence,
                          onChanged: (value) {
                            setState(() {
                              dlicence = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: AppHeight.h15),
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorManager.primaryColor),
                            borderRadius: BorderRadius.circular(AppRadius.r6)),
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: ColorManager.secondaryColor,
                          side: const BorderSide(
                              color: ColorManager.primaryColor),
                          title: Text(
                            AppStrings.kProofofAddress,
                            style: mediumTextStyle(
                              color: ColorManager.titleTextColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                          ),
                          value: addProof,
                          onChanged: (value) {
                            setState(() {
                              addProof = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: AppHeight.h15),
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorManager.primaryColor),
                            borderRadius: BorderRadius.circular(AppRadius.r6)),
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: ColorManager.secondaryColor,
                          side: const BorderSide(
                              color: ColorManager.primaryColor),
                          title: Text(
                            AppStrings.kRighttoWork,
                            style: mediumTextStyle(
                              color: ColorManager.titleTextColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                          ),
                          value: righttoWork,
                          onChanged: (value) {
                            setState(() {
                              righttoWork = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: AppElevatedButton(
                    onPressed: () {
                      AppRoutes.pushNamed(context,
                          name: AppRoutes.setExpiryDateScreen);
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
}
