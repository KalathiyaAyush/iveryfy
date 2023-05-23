// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/uis/screens/documents/widgets/document_card.dart';
import 'package:iverify/src/uis/screens/documents/widgets/multi_select.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

class MyDocumentScreen extends StatefulWidget {
  const MyDocumentScreen({super.key});

  @override
  State<MyDocumentScreen> createState() => _MyDocumentScreenState();
}

class _MyDocumentScreenState extends State<MyDocumentScreen> {
  List<String> selectedItems = [];

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
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p15, right: AppPadding.p15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppHeight.h70),
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
                  SizedBox(height: AppHeight.h15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          height: AppHeight.h40,
                          padding: EdgeInsets.only(
                              left: AppPadding.p12, right: AppPadding.p12),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorManager.primaryColor),
                            borderRadius: BorderRadius.circular(AppRadius.r12),
                          ),
                          child: DropdownButtonFormField(
                            style: regularTextStyle(
                              fontSize: FontSize.s15,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            icon:
                                SvgPicture.asset('lib/assets/svg/dropdown.svg'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: AppStrings.kAll,
                              hintStyle: regularTextStyle(
                                fontSize: FontSize.s15,
                                color: ColorManager.buttonGreyText,
                                fontFamily: FontConstants.quicksand,
                              ),
                            ),
                            items: const [
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
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'lib/assets/svg/drop_down.svg',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppHeight.h20),
                  Center(
                    child: Column(
                      children: [
                        // SizedBox(height: AppHeight.h100),
                        // Image.asset('lib/assets/images/documents.png'),
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding:
                EdgeInsets.only(bottom: AppPadding.p70, right: AppPadding.p8),
            child: Container(
              height: AppHeight.h45,
              width: AppWidth.w45,
              decoration: const BoxDecoration(
                color: ColorManager.textColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    AppRoutes.pushNamed(context,
                        name: AppRoutes.addDocumentScreen);
                  },
                  icon: Icon(Icons.add,
                      color: ColorManager.scaffoldBg, size: AppSize.s30),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
