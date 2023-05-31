import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';

class IverifiIDScreen extends StatelessWidget {
  const IverifiIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String id = 'xxxxxxxxxxxxxx1254';
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarWidget(onbackTap: () {
                  Navigator.of(context).pop();
                }),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Text(
                    AppStrings.kYouriVerifiID,
                    style: mediumTextStyle(
                      fontSize: FontSize.s24,
                      color: ColorManager.titleTextColor,
                      fontFamily: FontConstants.rubik,
                    ),
                  ),
                ),
                SizedBox(height: AppHeight.h30),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Container(
                    height: AppHeight.h50,
                    width: AppWidth.w330,
                    padding: EdgeInsets.only(
                        left: AppPadding.p12,
                        right: AppPadding.p12,
                        top: AppPadding.p8,
                        bottom: AppPadding.p8),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primaryColor),
                      borderRadius: BorderRadius.circular(AppRadius.r6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.kiVerifiID,
                                style: regularTextStyle(
                                  fontSize: FontSize.s13,
                                  color: ColorManager.hintTextColor,
                                  fontFamily: FontConstants.quicksand,
                                ),
                              ),
                              Text(
                                id,
                                style: mediumTextStyle(
                                  fontSize: FontSize.s17,
                                  color: ColorManager.textColor,
                                  fontFamily: FontConstants.quicksand,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await Clipboard.setData(
                                const ClipboardData(text: id));
                          },
                          icon: const Icon(
                            Icons.copy,
                            color: ColorManager.hintTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
