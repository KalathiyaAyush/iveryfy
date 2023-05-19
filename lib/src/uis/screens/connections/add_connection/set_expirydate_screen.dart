import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:iverify/src/resources/routes_manager.dart';
import 'package:iverify/src/uis/widgets/app_textfield.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/uis/widgets/appbar_widget.dart';

import '/src/uis/widgets/app_elevatedbutton.dart';

class SetExpirydateScreen extends StatefulWidget {
  const SetExpirydateScreen({super.key});

  @override
  State<SetExpirydateScreen> createState() => _SetExpirydateScreenState();
}

class _SetExpirydateScreenState extends State<SetExpirydateScreen> {
  DateTime? _selectedDate;
  final _expiryDateController = TextEditingController();
  String? radioValue;
  String value = "no expiry";
  String? dropdownValue = '1 month';

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
                  _buildText(),
                  SizedBox(height: AppHeight.h30),
                  Container(
                    height: AppHeight.h50,
                    width: AppWidth.w330,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.primaryColor),
                        borderRadius: BorderRadius.circular(AppRadius.r8)),
                    child: RadioListTile(
                      activeColor: ColorManager.secondaryColor,
                      title: Text(
                        AppStrings.kNoExpiryDate,
                        style: mediumTextStyle(
                          fontSize: FontSize.s18,
                          color: ColorManager.textColor,
                          fontFamily: FontConstants.quicksand,
                        ),
                      ),
                      value: value,
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() {
                          radioValue = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: AppHeight.h15),
                  Container(
                    height: AppHeight.h50,
                    width: AppWidth.w330,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primaryColor),
                      borderRadius: BorderRadius.circular(AppRadius.r8),
                    ),
                    child: RadioListTile(
                      activeColor: ColorManager.secondaryColor,
                      title: Text(
                        AppStrings.kStandard,
                        style: mediumTextStyle(
                          fontSize: FontSize.s18,
                          color: ColorManager.textColor,
                          fontFamily: FontConstants.quicksand,
                        ),
                      ),
                      value: 'Standard',
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() {
                          radioValue = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: AppHeight.h20),
                  radioValue == 'Standard'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.kSelectyourDuration,
                              style: regularTextStyle(
                                fontSize: FontSize.s15,
                                color: ColorManager.titleTextColor,
                                fontFamily: FontConstants.quicksand,
                              ),
                            ),
                            SizedBox(height: AppHeight.h10),
                            Container(
                                padding: EdgeInsets.only(
                                    left: AppPadding.p12,
                                    right: AppPadding.p12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorManager.buttonGreyText),
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r8),
                                ),
                                child: DropdownButtonFormField(
                                  value: dropdownValue,
                                  icon: SvgPicture.asset(
                                      'lib/assets/svg/dropdown.svg'),
                                  decoration: InputDecoration(
                                    hintText: AppStrings.kSelectDuration,
                                    labelText: AppStrings.kDuration,
                                    labelStyle: regularTextStyle(
                                      fontSize: FontSize.s15,
                                      color: ColorManager.buttonGreyText,
                                      fontFamily: FontConstants.quicksand,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                        value: '1 month',
                                        child: Text('1 month')),
                                    DropdownMenuItem(
                                        value: '3 month',
                                        child: Text('3 month')),
                                    DropdownMenuItem(
                                        value: '6 month',
                                        child: Text('6 month')),
                                    DropdownMenuItem(
                                        value: '12 month',
                                        child: Text('12 month')),
                                    DropdownMenuItem(
                                        value: 'Custom', child: Text('Custom'))
                                  ],
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownValue = value;
                                    });
                                  },
                                )),
                          ],
                        )
                      : Container(),
                  SizedBox(height: AppHeight.h10),
                  dropdownValue == 'Custom'
                      ? AppTextField(
                          style: mediumTextStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.textColor,
                            fontFamily: FontConstants.quicksand,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _expiryDateController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: SvgPicture.asset(
                              'lib/assets/svg/calendar.svg',
                              height: AppHeight.h15,
                            ),
                          ),
                          labelText: AppStrings.kExpiryDate,
                          labelStyle: regularTextStyle(
                            color: ColorManager.buttonGreyText,
                            fontFamily: FontConstants.quicksand,
                            fontSize: FontSize.s20,
                          ),
                        )
                      : Container(),
                  const Spacer(),
                  AppElevatedButton(
                    onPressed: () {
                      AppRoutes.pushNamed(
                        context,
                        name: AppRoutes.docSentScreen,
                      );
                    },
                    child: Text(
                      AppStrings.kSendDocuments,
                      style: regularTextStyle(
                        fontSize: FontSize.s17,
                        color: ColorManager.scaffoldBg,
                        fontFamily: FontConstants.quicksand,
                      ),
                    ),
                  ),
                  SizedBox(height: AppHeight.h20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.grey,
              accentColor: Colors.black,
              backgroundColor: Colors.lightBlue,
              cardColor: Colors.white,
            )),
            child: child!);
      },
    );
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _expiryDateController
        ..text = DateFormat('dd MMM yyyy').format(_selectedDate!)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: _expiryDateController.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.kSetExpiryDate,
          style: semiBoldTextStyle(
            fontSize: FontSize.s24,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.rubik,
          ),
        ),
        SizedBox(height: AppHeight.h4),
        Text(
          AppStrings.kSetExpiryDateDes,
          style: regularTextStyle(
            fontSize: FontSize.s15,
            color: ColorManager.titleTextColor,
            fontFamily: FontConstants.quicksand,
          ),
        ),
      ],
    );
  }
}
