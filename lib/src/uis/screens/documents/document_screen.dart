// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/resources/assets_manager.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:iverify/src/uis/screens/documents/widgets/custom_dropdown.dart';
import 'package:iverify/src/uis/widgets/app_iconbutton.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/uis/screens/documents/widgets/multi_select.dart';
import '/src/uis/screens/documents/widgets/document_card.dart';

class MyDocumentScreen extends StatefulWidget {
  const MyDocumentScreen({super.key});

  @override
  State<MyDocumentScreen> createState() => _MyDocumentScreenState();
}

class _MyDocumentScreenState extends State<MyDocumentScreen> {
  List<String> selectedItems = [];
  String dropdownvalue = AppStrings.kAll;

  void _showMultiSelect() async {
    final List<String> tagsList = [
      AppStrings.kIDProof,
      AppStrings.kTravel,
      AppStrings.kPersonal,
      AppStrings.kInsurance,
      AppStrings.kEducation,
    ];
    final List<String>? results = await showDialog(
      context: context,
      builder: (context) {
        return MutliSelect(tagsList: tagsList);
      },
    );

    if (results != null) {
      setState(() {
        selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(AppRoutes.bottomNavigationScreen);
        return false;
      },
      child: ScreenUtilInit(
        builder: (context, child) {
          return Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppPadding.p15,
                          right: AppPadding.p15,
                          bottom: AppPadding.p15,
                          top: AppPadding.p70),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.kMyDocuments,
                            style: mediumTextStyle(
                              fontSize: FontSize.s24,
                              color: ColorManager.titleTextColor,
                              fontFamily: FontConstants.rubik,
                            ),
                          ),
                          SizedBox(height: AppHeight.h5),
                          Text(
                            AppStrings.kDocumentsDes,
                            style: mediumTextStyle(
                              fontSize: FontSize.s13,
                              color: ColorManager.titleTextColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.p15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              height: AppHeight.h40,
                              padding: EdgeInsets.only(right: AppPadding.p12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorManager.primaryColor),
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r12),
                              ),
                              child: DropdownButton2(
                                alignment: AlignmentDirectional.center,
                                underline: Container(),
                                isExpanded: true,
                                style: regularTextStyle(
                                  fontSize: FontSize.s15,
                                  color: ColorManager.textColor,
                                  fontFamily: FontConstants.quicksand,
                                ),
                                iconStyleData: IconStyleData(
                                    icon: SvgPicture.asset(
                                        'lib/assets/svg/dropdown.svg')),
                                value: dropdownvalue,
                                items: const [
                                  DropdownMenuItem(
                                      value: AppStrings.kAll,
                                      child: Text(AppStrings.kAll)),
                                  DropdownMenuItem(
                                      value: AppStrings.kIDProof,
                                      child: Text(AppStrings.kIDProof)),
                                  DropdownMenuItem(
                                      value: AppStrings.kTravel,
                                      child: Text(AppStrings.kTravel)),
                                  DropdownMenuItem(
                                      value: AppStrings.kPersonal,
                                      child: Text(AppStrings.kPersonal)),
                                  DropdownMenuItem(
                                      value: AppStrings.kInsurance,
                                      child: Text(AppStrings.kInsurance)),
                                  DropdownMenuItem(
                                      value: AppStrings.kEducation,
                                      child: Text(AppStrings.kEducation)),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    dropdownvalue = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: AppPadding.p20, right: AppPadding.p2),
                              child:
                                  SvgPicture.asset(ImageAssets.dropdownIcon2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppHeight.h20),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          padding: EdgeInsets.only(
                              right: AppPadding.p15,
                              left: AppPadding.p15,
                              bottom: AppPadding.p50),
                          itemBuilder: (context, index) =>
                              // SizedBox(height: AppHeight.h100),
                              // Image.asset(ImageAssets.documentsIcon),
                              // Text(
                              //   AppStrings.knoConnectionFound,
                              //   textAlign: TextAlign.center,
                              //   style: regularTextStyle(
                              //     fontSize: FontSize.s14,
                              //     color: ColorManager.hintTextColor,
                              //     fontFamily: FontConstants.quicksand,
                              //   ),
                              // ),
                              DocumentCard(
                                onTap: () {
                                  AppRoutes.pushNamed(context,
                                      name: AppRoutes.passportDetailScreen);
                                },
                              )),
                    ),
                  ],
                ),
              ),
              floatingActionButton: Padding(
                padding: EdgeInsets.only(
                    bottom: AppPadding.p60, right: AppPadding.p8),
                child: AppIconbutton(
                  onTap: () {
                    AppRoutes.pushNamed(context,
                        name: AppRoutes.addDocumentScreen);
                  },
                ),
              ));
        },
      ),
    );
  }
}
