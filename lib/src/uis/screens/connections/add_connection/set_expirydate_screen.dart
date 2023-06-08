import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/uis/widgets/app_textfield.dart';
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
          backgroundColor: ColorManager.scaffoldBg,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarWidget(onbackTap: () {
                  Navigator.of(context).pop();
                }),
                _buildText(),
                SizedBox(height: AppHeight.h30),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorManager.primaryColor),
                            borderRadius: BorderRadius.circular(AppRadius.r8)),
                        child: RadioListTile(
                          visualDensity: const VisualDensity(horizontal: -4.0),
                          contentPadding: EdgeInsets.zero,
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
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorManager.primaryColor),
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                        ),
                        child: RadioListTile(
                          visualDensity: const VisualDensity(horizontal: -4.0),
                          contentPadding: EdgeInsets.zero,
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
                    ],
                  ),
                ),
                SizedBox(height: AppHeight.h20),
                radioValue == 'Standard'
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p20, right: AppPadding.p20),
                        child: Column(
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
                                width: double.infinity,
                                height: AppHeight.h45,
                                padding: EdgeInsets.only(right: AppPadding.p12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorManager.primaryColor),
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r8),
                                ),
                                child: DropdownButton2(
                                  isExpanded: true,
                                  value: dropdownValue,
                                  alignment: AlignmentDirectional.center,
                                  underline: Container(),
                                  style: regularTextStyle(
                                    fontSize: FontSize.s15,
                                    color: ColorManager.textColor,
                                    fontFamily: FontConstants.quicksand,
                                  ),
                                  iconStyleData: IconStyleData(
                                    icon: SvgPicture.asset(
                                        'lib/assets/svg/dropdown.svg'),
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
                        ),
                      )
                    : Container(),
                SizedBox(height: AppHeight.h10),
                dropdownValue == 'Custom'
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: AppPadding.p20, right: AppPadding.p20),
                        child: AppTextField(
                          isEnabled: false,
                          controller: _expiryDateController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: SvgPicture.asset(
                              ImageAssets.calendarIcon,
                              height: AppHeight.h15,
                            ),
                          ),
                          labelText: AppStrings.kExpiryDate,
                        ),
                      )
                    : Container(),
                const Spacer(),
                Center(
                  child: AppElevatedButton(
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
                ),
                SizedBox(height: AppHeight.h20),
              ],
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
              // : Colors.black,
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
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
      child: Column(
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
              fontSize: FontSize.s13,
              color: ColorManager.titleTextColor,
              fontFamily: FontConstants.quicksand,
            ),
          ),
        ],
      ),
    );
  }
}
