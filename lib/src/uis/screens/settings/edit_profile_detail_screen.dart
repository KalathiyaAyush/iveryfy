// ignore_for_file: unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iverify/src/resources/assets_manager.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/app_textfield.dart';
import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class EditProfileDetailScreen extends StatefulWidget {
  const EditProfileDetailScreen({super.key});

  @override
  State<EditProfileDetailScreen> createState() =>
      _EditProfileDetailScreenState();
}

class _EditProfileDetailScreenState extends State<EditProfileDetailScreen> {
  DateTime? _selectedDate;
  File? _image;
  XFile? imageFile;
  FilePickerResult? resultFile;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _ninController = TextEditingController();
  final _homeAddressController = TextEditingController();

  pickFile() async {
    resultFile = await FilePicker.platform.pickFiles(
      withReadStream: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', '.png', '.jpeg'],
    );

    if (resultFile != null) {
      PlatformFile file = resultFile!.files.first;
      print(file.name);
      print(file.bytes);
      print(file.extension);
      print(file.path);
    } else {
      print('no file selected');
    }
  }

  Future imageSelector(BuildContext context, String pickerType) async {
    switch (pickerType) {
      case AppStrings.kGallery:
        imageFile = (await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 90));
        break;

      case AppStrings.kCamera:
        imageFile = (await ImagePicker()
            .pickImage(source: ImageSource.camera, imageQuality: 90));
        break;
    }

    setState(() {
      _image = File(imageFile!.path);
    });
  }

  _showImagePickerSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => {
              imageSelector(context, AppStrings.kCamera),
              Navigator.pop(context),
            },
            child: const Text(AppStrings.kCamera),
          ),
          CupertinoActionSheetAction(
            onPressed: () => {
              imageSelector(context, AppStrings.kGallery),
              Navigator.pop(context),
            },
            child: const Text(AppStrings.kGallery),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () => {
            Navigator.pop(context),
          },
          child: const Text(AppStrings.kCancel),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width * 0.40;

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
                    AppStrings.kEditProfileDetails,
                    style: mediumTextStyle(
                      fontSize: FontSize.s24,
                      color: ColorManager.titleTextColor,
                      fontFamily: FontConstants.rubik,
                    ),
                  ),
                ),
                SizedBox(height: AppHeight.h30),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              height: imageSize,
                              width: imageSize,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(imageSize),
                                border: Border.all(
                                    color: ColorManager.secondaryColor,
                                    width: AppWidth.w5),
                              ),
                              child: imageFile != null
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(imageSize),
                                      child: Image.file(
                                        File(imageFile!.path),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Text(''),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: AppHeight.h40,
                                width: AppWidth.w40,
                                decoration: const BoxDecoration(
                                    color: ColorManager.scaffoldBg,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.09),
                                          blurRadius: 4.69,
                                          offset: Offset(
                                            0,
                                            1.56,
                                          )),
                                    ]),
                                child: Center(
                                  child: IconButton(
                                    onPressed: _showImagePickerSheet,
                                    icon: SvgPicture.asset(
                                        ImageAssets.cameraIcon),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppHeight.h20),
                      Form(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: AppPadding.p20, right: AppPadding.p20),
                          child: Column(
                            children: [
                              AppTextField(
                                controller: _firstNameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: AppStrings.kFirstName,
                              ),
                              SizedBox(height: AppHeight.h15),
                              AppTextField(
                                controller: _lastNameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: AppStrings.kLastName,
                              ),
                              SizedBox(height: AppHeight.h15),
                              AppTextField(
                                controller: _dateController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: AppStrings.kDateofBirth,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  icon: SvgPicture.asset(
                                      ImageAssets.calendarIcon,
                                      height: AppHeight.h16),
                                ),
                              ),
                              SizedBox(height: AppHeight.h15),
                              AppTextField(
                                controller: _nationalityController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: AppStrings.kNationality,
                              ),
                              SizedBox(height: AppHeight.h15),
                              AppTextField(
                                controller: _phoneNumberController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: AppStrings.kPhoneNumber,
                              ),
                              SizedBox(height: AppHeight.h15),
                              AppTextField(
                                controller: _emailController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: AppStrings.kEmailAddress,
                              ),
                              SizedBox(height: AppHeight.h15),
                              AppTextField(
                                controller: _ninController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: AppStrings.kNIN,
                              ),
                              SizedBox(height: AppHeight.h15),
                              AppTextField(
                                controller: _homeAddressController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: AppStrings.kHomeAddress,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: AppHeight.h30),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: AppElevatedButton(
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
