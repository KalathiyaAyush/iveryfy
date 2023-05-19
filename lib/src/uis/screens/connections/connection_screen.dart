// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: AppHeight.h60),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextWidget(),
                    SizedBox(width: AppWidth.w25),
                    SvgPicture.asset('lib/assets/svg/search.svg'),
                  ],
                ),
                SizedBox(height: AppHeight.h20),
                TabBar(
                  controller: _tabController,
                  labelColor: ColorManager.scaffoldBg,
                  indicatorColor: ColorManager.titleTextColor,
                  unselectedLabelColor: ColorManager.buttonGreyText,
                  indicatorPadding: EdgeInsets.only(
                    left: AppPadding.p15,
                    right: AppPadding.p15,
                    bottom: AppPadding.p2,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r6),
                    color: ColorManager.titleTextColor,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r6),
                          border: Border.all(color: ColorManager.primaryColor),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppStrings.kCurrent,
                            style: TextStyle(
                              fontSize: FontSize.s16,
                              fontFamily: FontConstants.quicksand,
                              fontWeight: FontWeightManager.medium,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r6),
                          border: Border.all(color: ColorManager.primaryColor),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppStrings.kHistory,
                            style: TextStyle(
                              fontSize: FontSize.s16,
                              fontFamily: FontConstants.quicksand,
                              fontWeight: FontWeightManager.medium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppHeight.h20),
                connectionCard(() {
                  AppRoutes.pushNamed(context,
                      name: AppRoutes.manageConnectionScreen);
                }),
                // SizedBox(height: AppHeight.h100),
                // Image.asset('lib/assets/images/no_connections.png'),
                // SizedBox(height: AppHeight.h13),
                // Text(
                //   AppStrings.knoConnectionFound,
                //   textAlign: TextAlign.center,
                //   style: regularTextStyle(
                //     fontSize: FontSize.s17,
                //     color: ColorManager.hintTextColor,
                //     fontFamily: FontConstants.quicksand,
                //   ),
                // ),
              ],
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
                        name: AppRoutes.addNewConnectionScreen);
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

  Widget _buildTextWidget() {
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.kConnections,
            style: mediumTextStyle(
              fontSize: FontSize.s26,
              color: ColorManager.titleTextColor,
              fontFamily: FontConstants.rubik,
            ),
          ),
          SizedBox(height: AppHeight.h5),
          Text(
            AppStrings.kConnectionDes,
            style: regularTextStyle(
              fontSize: FontSize.s14,
              color: ColorManager.titleTextColor,
              fontFamily: FontConstants.quicksand,
            ),
          ),
        ],
      ),
    );
  }

  Widget connectionCard(Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppHeight.h130,
        width: AppWidth.w330,
        padding: EdgeInsets.only(left: AppPadding.p18, right: AppPadding.p18),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.primaryColor),
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jason Stamford',
                      style: semiBoldTextStyle(
                        fontSize: FontSize.s19,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                    SizedBox(height: AppHeight.h5),
                    Text(
                      '4 Documents',
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: const Color.fromRGBO(64, 145, 108, 1),
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: AppWidth.w55,
                  child: CircleProgressBar(
                    backgroundColor: ColorManager.buttonGreyText,
                    foregroundColor: ColorManager.secondaryColor,
                    strokeWidth: 5,
                    value: 3,
                    child: Center(
                      child: Text(
                        '60d \nLeft',
                        style: regularTextStyle(
                          fontSize: FontSize.s13,
                          color: ColorManager.textColor,
                          fontFamily: FontConstants.quicksand,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: ColorManager.buttonGreyText,
              thickness: 1,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.kSharedon,
                      style: regularTextStyle(
                        fontSize: FontSize.s15,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                    Text(
                      '30 July 2022, 12:00:00',
                      style: mediumTextStyle(
                        fontSize: FontSize.s15,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppHeight.h10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.kExpiry,
                      style: regularTextStyle(
                        fontSize: FontSize.s15,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                    Text(
                      '30 July 2023, 12:00:00',
                      style: mediumTextStyle(
                        fontSize: FontSize.s15,
                        color: ColorManager.textColor,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppHeight.h1),
          ],
        ),
      ),
    );
  }
}
