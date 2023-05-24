import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/screens/home/appbar_widget/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    homeUserCard();
  }

  List cardList = [
    for (int i = 0; i < 10; i++)
      {
        const Card(),
      }
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: AppHeight.h70),
                const AppBarWidget(),
                SizedBox(height: AppHeight.h20),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.kActivities,
                        style: mediumTextStyle(
                          fontSize: FontSize.s18,
                          color: ColorManager.titleTextColor,
                          fontFamily: FontConstants.rubik,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppHeight.h15),
                activitiesButtons(),
                SizedBox(height: AppHeight.h15),
                cardList.isEmpty
                    ? Column(
                        children: [
                          SizedBox(height: AppHeight.h60),
                          Image.asset(ImageAssets.errorIcon),
                          SizedBox(height: AppHeight.h10),
                          Text(
                            AppStrings.knoActivities,
                            textAlign: TextAlign.center,
                            style: regularTextStyle(
                              fontSize: FontSize.s15,
                              color: ColorManager.hintTextColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                          ),
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cardList.length,
                          itemBuilder: (context, index) {
                            return homeUserCard();
                          },
                        ),
                      ),
                SizedBox(height: AppHeight.h40),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget activitiesButtons() {
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        controller: _tabController,
        labelColor: ColorManager.scaffoldBg,
        indicatorColor: ColorManager.titleTextColor,
        unselectedLabelColor: ColorManager.buttonGreyText,
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
        indicatorPadding: EdgeInsets.only(
          left: AppPadding.p11,
          right: AppPadding.p11,
          bottom: AppPadding.p3,
        ),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r6),
          color: ColorManager.titleTextColor,
        ),
        tabs: [
          Container(
            width: AppWidth.w90,
            height: AppHeight.h32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r6),
              border: Border.all(color: ColorManager.primaryColor),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.kActive,
                style: TextStyle(
                  fontSize: FontSize.s12,
                  fontFamily: FontConstants.quicksand,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
          ),
          Container(
            width: AppWidth.w90,
            height: AppHeight.h32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r6),
              border: Border.all(color: ColorManager.primaryColor),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.kExpired,
                style: TextStyle(
                  fontSize: FontSize.s12,
                  fontFamily: FontConstants.quicksand,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
          ),
          Container(
            width: AppWidth.w90,
            height: AppHeight.h32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r6),
              border: Border.all(color: ColorManager.primaryColor),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.kVerified,
                style: TextStyle(
                  fontSize: FontSize.s12,
                  fontFamily: FontConstants.quicksand,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget homeUserCard() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: AppPadding.p18, left: AppPadding.p20, right: AppPadding.p20),
      child: Container(
        width: AppWidth.w335,
        padding: EdgeInsets.only(
            left: AppPadding.p10,
            right: AppPadding.p10,
            top: AppPadding.p10,
            bottom: AppPadding.p10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r12),
            border: Border.all(
              color: ColorManager.primaryColor,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              ImageAssets.clockIcon,
              height: AppHeight.h22,
            ),
            SizedBox(width: AppWidth.w5),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Document access for Bethany Blake',
                    style: mediumTextStyle(
                      fontSize: FontSize.s16,
                      color: ColorManager.textColor,
                      fontFamily: FontConstants.quicksand,
                    ),
                  ),
                  SizedBox(height: AppHeight.h5),
                  Text(
                    _tabController?.index == 0
                        ? 'Active - 22 sep 2023 12:00:23'
                        : _tabController?.index == 1
                            ? 'Expired - 22 sep 2023 12:00:23'
                            : _tabController?.index == 2
                                ? 'Verified - 22 sep 2023 12:00:23'
                                : 'Something went wrong',
                    style: mediumTextStyle(
                      fontSize: FontSize.s16,
                      color: _tabController?.index == 0
                          ? const Color.fromRGBO(82, 183, 136, 1)
                          : _tabController?.index == 1
                              ? const Color.fromRGBO(255, 59, 48, 1)
                              : _tabController?.index == 2
                                  ? const Color.fromARGB(255, 143, 123, 231)
                                  : Colors.black,
                      fontFamily: FontConstants.quicksand,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class HomeUserCard extends StatelessWidget {
//   const HomeUserCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: AppPadding.p18),
//       child: Container(
//         height: AppHeight.h80,
//         width: AppWidth.w335,
//         padding: EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p10),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(AppRadius.r12),
//             border: Border.all(
//               color: ColorManager.primaryColor,
//             )),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: AppPadding.p20),
//               child: SvgPicture.asset(
//                 'lib/assets/svg/clock.svg',
//                 height: AppHeight.h22,
//               ),
//             ),
//             SizedBox(width: AppWidth.w5),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Document access for Bethany \nBlake',
//                   style: mediumTextStyle(
//                     fontSize: FontSize.s20,
//                     color: ColorManager.textColor,
//                     fontFamily: FontConstants.quicksand,
//                   ),
//                 ),
//                 SizedBox(height: AppHeight.h5),
//                 Text(
//                   'Expired - 22 sep 2023 12:00:23',
//                   style: mediumTextStyle(
//                     fontSize: FontSize.s16,
//                     color:  const Color.fromRGBO(255, 59, 48, 1),
//                     fontFamily: FontConstants.quicksand,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
