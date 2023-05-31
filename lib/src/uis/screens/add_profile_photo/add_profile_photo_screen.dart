// ignore_for_file: unused_field

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/assets_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/widgets/app_textbutton.dart';
import '/src/uis/widgets/app_title_text.dart';
import '/src/uis/widgets/app_elevatedbutton.dart';

class AddProfilePhoto extends StatefulWidget {
  const AddProfilePhoto({super.key});

  // final void Function(File pickedImage)? imagePickFn;

  @override
  State<AddProfilePhoto> createState() => _AddProfilePhotoState();
}

class _AddProfilePhotoState extends State<AddProfilePhoto> {
  File? _image;
  XFile? imageFile;
  FilePickerResult? resultFile;

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
    final imageSize = MediaQuery.of(context).size.width * 0.55;

    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: ColorManager.scaffoldBg,
          body: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarWidget(
                  onbackTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                const AppTitleText(
                  title: AppStrings.kAddProfilePhoto,
                  titleDes: AppStrings.kAddProfilePhotoDes,
                ),
                const Spacer(),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: imageSize,
                        width: imageSize,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(imageSize),
                          color: ColorManager.primaryColor,
                        ),
                        child: imageFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(imageSize),
                                child: Image.file(
                                  File(imageFile!.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Center(
                                child: SvgPicture.asset(ImageAssets.imageIcon),
                              ),
                      ),
                    ),
                    Positioned(
                        bottom: AppSize.s10,
                        right: AppSize.s100,
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
                                offset: Offset(0, 1.56),
                              )
                            ],
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: _showImagePickerSheet,
                              icon: SvgPicture.asset(ImageAssets.cameraIcon),
                            ),
                          ),
                        )),
                  ],
                ),
                const Spacer(),
                Center(
                  child: AppElevatedButton(
                    onPressed: imageFile != null ? () {} : null,
                    child: Text(
                      AppStrings.kNext,
                      style: mediumTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.scaffoldBg,
                        fontFamily: FontConstants.quicksand,
                      ),
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
        );
      },
    );
  }
}
