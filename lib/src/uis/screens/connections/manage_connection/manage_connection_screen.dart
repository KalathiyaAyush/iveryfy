import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_name_container.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';
import '/src/uis/widgets/app_outlinedbutton.dart';

class ManageConnectionScreen extends StatefulWidget {
  const ManageConnectionScreen({super.key});

  @override
  State<ManageConnectionScreen> createState() => _ManageConnectionScreenState();
}

class _ManageConnectionScreenState extends State<ManageConnectionScreen> {
  DateTime? _selectedDate;
  final _dateController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.kManageConnection,
                        style: mediumTextStyle(
                          fontSize: FontSize.s24,
                          color: ColorManager.titleTextColor,
                          fontFamily: FontConstants.rubik,
                        ),
                      ),
                      SizedBox(height: AppHeight.h4),
                      Text(
                        AppStrings.kManagerConnectionDes,
                        style: regularTextStyle(
                          fontSize: FontSize.s14,
                          color: ColorManager.titleTextColor,
                          fontFamily: FontConstants.quicksand,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppHeight.h20),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const NameContainer(
                          name: 'Jason Stamford', email: 'example@gmail.com'),
                      SizedBox(height: AppHeight.h15),
                      Center(
                        child: Container(
                          width: AppWidth.w330,
                          padding: EdgeInsets.all(AppPadding.p8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadius.r4),
                            border:
                                Border.all(color: ColorManager.primaryColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.kShareDocuments,
                                style: regularTextStyle(
                                  fontSize: FontSize.s14,
                                  color: ColorManager.hintTextColor,
                                  fontFamily: FontConstants.quicksand,
                                ),
                              ),
                              SizedBox(height: AppHeight.h10),
                              _buildDocCard(AppStrings.kPassport),
                              SizedBox(height: AppHeight.h8),
                              _buildDocCard(AppStrings.kDriverLicense),
                              SizedBox(height: AppHeight.h8),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: AppHeight.h10),
                      dateContainer(),
                      SizedBox(height: AppHeight.h10),
                    ],
                  ),
                ),
                // const Spacer(),
                Center(
                  child: AppElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.kExtendexpirydate,
                      style: regularTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.scaffoldBg,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppHeight.h15),
                Center(
                  child: AppOutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r20)),
                              content: SizedBox(
                                width: AppWidth.w330,
                                height: AppHeight.h180,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset('lib/assets/images/delete.png'),
                                    SizedBox(height: AppHeight.h15),
                                    Text(
                                      AppStrings.kdeleteDocument,
                                      textAlign: TextAlign.center,
                                      style: semiBoldTextStyle(
                                        fontSize: FontSize.s20,
                                        color: ColorManager.textColor,
                                        fontFamily: FontConstants.quicksand,
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: AppHeight.h42,
                                          width: AppWidth.w110,
                                          child: OutlinedButton(
                                              onPressed: () {},
                                              child: Text(
                                                AppStrings.kNo,
                                                style: mediumTextStyle(
                                                  fontSize: FontSize.s17,
                                                  color: ColorManager
                                                      .buttonGreyText,
                                                  fontFamily:
                                                      FontConstants.quicksand,
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: AppHeight.h42,
                                          width: AppWidth.w110,
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: ColorManager
                                                      .secondaryColor),
                                              child: Text(
                                                AppStrings.kyes,
                                                style: mediumTextStyle(
                                                  fontSize: FontSize.s17,
                                                  color:
                                                      ColorManager.scaffoldBg,
                                                  fontFamily:
                                                      FontConstants.quicksand,
                                                ),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        },
                      );
                    },
                    data: AppStrings.kEndsharenow,
                  ),
                ),
                SizedBox(height: AppHeight.h20),
              ],
            ),
          ),
        );
      },
    );
  }

  // ignore: unused_element
  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blueGrey,
              accentColor: Colors.black,
              backgroundColor: Colors.lightBlue,
              cardColor: Colors.white,
            )),
            child: child!);
      },
    );
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _dateController
        ..text = DateFormat('dd MMM yyyy').format(_selectedDate!)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: _dateController.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }

  Widget _buildDocCard(String data) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: AppPadding.p10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r4),
        border: Border.all(color: ColorManager.primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'lib/assets/svg/pass.svg',
                height: AppHeight.h25,
              ),
              SizedBox(width: AppWidth.w8),
              Text(
                data,
                style: mediumTextStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.titleTextColor,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('lib/assets/svg/delete.svg'),
          ),
        ],
      ),
    );
  }

  Widget dateContainer() {
    return Center(
      child: Container(
        width: AppWidth.w330,
        padding: EdgeInsets.only(
            left: AppPadding.p20,
            right: AppPadding.p20,
            top: AppPadding.p20,
            bottom: AppPadding.p10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r4),
          border: Border.all(color: ColorManager.primaryColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.kSharedon,
                  style: regularTextStyle(
                    fontSize: FontSize.s15,
                    color: ColorManager.hintTextColor,
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
                    color: ColorManager.hintTextColor,
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
            const Divider(
              color: ColorManager.primaryColor,
              thickness: 2,
            ),
            Text(
              '6o Day\'s left',
              style: regularTextStyle(
                fontSize: FontSize.s16,
                color: const Color.fromRGBO(255, 59, 48, 1),
                fontFamily: FontConstants.quicksand,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
