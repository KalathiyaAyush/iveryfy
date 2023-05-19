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
import '/src/uis/screens/connections/widgets/share_doc_card.dart';

class ShareDocumentScreen extends StatelessWidget {
  const ShareDocumentScreen({super.key});

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
                  SizedBox(height: AppHeight.h20),
                  AppbarWidget(onbackTap: () {
                    Navigator.of(context).pop();
                  }),
                  const AppTitleText(
                    title: AppStrings.kShareDocuments,
                    titleDes: AppStrings.kShareDocumentsDes,
                  ),
                  SizedBox(height: AppHeight.h20),
                  ShareDocCard(
                    title: AppStrings.kPassport,
                    isSelected: true,
                    onChange: (value) {},
                  ),
                  SizedBox(height: AppHeight.h15),
                  ShareDocCard(
                    title: AppStrings.kDriverLicense,
                    isSelected: true,
                    onChange: (value) {},
                  ),
                  SizedBox(height: AppHeight.h15),
                  ShareDocCard(
                    title: AppStrings.kProofofAddress,
                    isSelected: false,
                    onChange: (value) {},
                  ),
                  SizedBox(height: AppHeight.h15),
                  ShareDocCard(
                    title: AppStrings.kRighttoWork,
                    isSelected: false,
                    onChange: (value) {},
                  ),
                  const Spacer(),
                  AppElevatedButton(
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
