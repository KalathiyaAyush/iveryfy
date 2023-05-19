import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_textbutton.dart';
import '/src/uis/widgets/app_title_text.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class AddProfilePhoto extends StatelessWidget {
  const AddProfilePhoto({super.key});

  void _backTap(BuildContext ctx) {
    AppRoutes.popUntil(
      ctx,
      name: AppRoutes.faceBiometricScreen,
    );
  }

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
                  SizedBox(height: AppHeight.h15),
                  AppbarWidget(
                    onbackTap: () {
                      _backTap(context);
                    },
                  ),
                  SizedBox(height: AppHeight.h10),
                  const AppTitleText(
                    title: AppStrings.kAddProfilePhoto,
                    titleDes: AppStrings.kAddProfilePhotoDes,
                  ),
                  SizedBox(height: AppHeight.h100),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: AppHeight.h200,
                          width: AppWidth.w200,
                          decoration: const BoxDecoration(
                            color: ColorManager.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset('lib/assets/svg/image.svg'),
                          ),
                        ),
                        Positioned(
                          top: AppSize.s160,
                          left: AppSize.s140,
                          child: Container(
                            height: AppHeight.h40,
                            width: AppWidth.w40,
                            decoration: const BoxDecoration(
                              color: ColorManager.scaffoldBg,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.09),
                                  blurRadius: 25.0,
                                )
                              ],
                            ),
                            child: Center(
                                child: SvgPicture.asset(
                                    'lib/assets/svg/camera.svg')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  AppElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.kNext,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.scaffoldBg,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ),
                  SizedBox(height: AppHeight.h5),
                  Center(
                    child: AppTextButton(
                        onPressed: () {
                          AppRoutes.pushNamed(
                            context,
                            name: AppRoutes.idVerificationScreen,
                          );
                        },
                        child: Text(
                          AppStrings.kSkipForNow,
                          style: regularTextStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.titleTextColor,
                            fontFamily: FontConstants.quicksand,
                          ),
                        )),
                  ),
                  SizedBox(height: AppHeight.h10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
