import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:iverify/src/uis/widgets/app_elevatedbutton.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/app_textfield.dart';
import '/src/uis/widgets/appbar_widget.dart';

class EditProfileDetailScreen extends StatefulWidget {
  const EditProfileDetailScreen({super.key});

  @override
  State<EditProfileDetailScreen> createState() =>
      _EditProfileDetailScreenState();
}

class _EditProfileDetailScreenState extends State<EditProfileDetailScreen> {
  DateTime? _selectedDate;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _ninController = TextEditingController();
  final _homeAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppHeight.h10),
                    AppbarWidget(onbackTap: () {
                      Navigator.of(context).pop();
                    }),
                    Text(
                      AppStrings.kEditProfileDetails,
                      style: mediumTextStyle(
                        fontSize: FontSize.s24,
                        color: ColorManager.titleTextColor,
                        fontFamily: FontConstants.rubik,
                      ),
                    ),
                    SizedBox(height: AppHeight.h30),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: AppHeight.h120,
                            width: AppWidth.w130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: AppWidth.w4,
                                color: ColorManager.secondaryColor,
                              ),
                            ),
                          ),
                          Positioned(
                            top: AppSize.s90,
                            left: AppSize.s90,
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
                                    ),
                                  ]),
                              child: Center(
                                child: SvgPicture.asset(
                                    'lib/assets/svg/camera.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppHeight.h20),
                    Form(
                      child: Column(
                        children: [
                          AppTextField(
                            style: mediumTextStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            controller: _firstNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            labelText: AppStrings.kFirstName,
                            labelStyle: regularTextStyle(
                              color: ColorManager.buttonGreyText,
                              fontFamily: FontConstants.quicksand,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          SizedBox(height: AppHeight.h15),
                          AppTextField(
                            style: mediumTextStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            controller: _lastNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            labelText: AppStrings.kLastName,
                            labelStyle: regularTextStyle(
                              color: ColorManager.buttonGreyText,
                              fontFamily: FontConstants.quicksand,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          SizedBox(height: AppHeight.h15),
                          AppTextField(
                            style: mediumTextStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            controller: _dateController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            labelText: AppStrings.kDateofBirth,
                            labelStyle: regularTextStyle(
                              color: ColorManager.buttonGreyText,
                              fontFamily: FontConstants.quicksand,
                              fontSize: FontSize.s20,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              icon: SvgPicture.asset(
                                  'lib/assets/svg/calendar.svg',
                                  height: AppHeight.h16),
                            ),
                          ),
                          SizedBox(height: AppHeight.h15),
                          AppTextField(
                            style: mediumTextStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            controller: _nationalityController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            labelText: AppStrings.kNationality,
                            labelStyle: regularTextStyle(
                              color: ColorManager.buttonGreyText,
                              fontFamily: FontConstants.quicksand,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          SizedBox(height: AppHeight.h15),
                          AppTextField(
                            style: mediumTextStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            controller: _phoneNumberController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            labelText: AppStrings.kPhoneNumber,
                            labelStyle: regularTextStyle(
                              color: ColorManager.buttonGreyText,
                              fontFamily: FontConstants.quicksand,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          SizedBox(height: AppHeight.h15),
                          AppTextField(
                            style: mediumTextStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            controller: _emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            labelText: AppStrings.kEmailAddress,
                            labelStyle: regularTextStyle(
                              color: ColorManager.buttonGreyText,
                              fontFamily: FontConstants.quicksand,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          SizedBox(height: AppHeight.h15),
                          AppTextField(
                            style: mediumTextStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            controller: _ninController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            labelText: AppStrings.kNIN,
                            labelStyle: regularTextStyle(
                              color: ColorManager.buttonGreyText,
                              fontFamily: FontConstants.quicksand,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          SizedBox(height: AppHeight.h15),
                          AppTextField(
                            style: mediumTextStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            controller: _homeAddressController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            labelText: AppStrings.kHomeAddress,
                            labelStyle: regularTextStyle(
                              color: ColorManager.buttonGreyText,
                              fontFamily: FontConstants.quicksand,
                              fontSize: FontSize.s20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppHeight.h30),
                    AppElevatedButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.kSave,
                        style: mediumTextStyle(
                          fontSize: FontSize.s18,
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
          ),
        );
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1990),
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
      _dateController
        ..text = DateFormat('dd/MM/yyyy').format(_selectedDate!)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: _dateController.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }
}
