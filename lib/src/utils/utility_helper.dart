import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity/connectivity.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


import '../AppStrings.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

class UtilityHelper {
  static final countryNames = [
    "United Kingdom",
    "USA",
  ];

  // static Map<String, dynamic> getUserDetailsFrom({required String token}) {
  //   Map<String, dynamic> user = JwtDecoder.decode(token);
  //   showLog(user.toString());
  //   return user;
  // }

  static String baseEncoe(File? file) {
    Uint8List? imgbytes = file?.readAsBytesSync();
    String bs4str = base64Encode(imgbytes ?? []);
    //showLog(bs4str);
    return bs4str;
  }

  // static Future<File?> openFilePicker(BuildContext context) async {
  //   String? pickedFilePath;
  //   final PickerActionType? actionType =
  //   await DialogHelper.showActionSheet<PickerActionType>(
  //     context,
  //     actions: const [
  //       SheetAction(
  //         key: PickerActionType.camera,
  //         label: 'Take Photo',
  //       ),
  //       SheetAction(
  //         key: PickerActionType.library,
  //         label: 'Photo Library',
  //       ),
  //       SheetAction(
  //         key: PickerActionType.video,
  //         label: 'Video',
  //       ),
  //       SheetAction(
  //         key: PickerActionType.document,
  //         label: 'Document',
  //       ),
  //     ],
  //   );
  //
  //   switch (actionType) {
  //     case PickerActionType.camera:
  //       final ImagePicker picker = ImagePicker();
  //       final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  //       pickedFilePath = photo?.path;
  //       break;
  //     case PickerActionType.library:
  //       final ImagePicker picker = ImagePicker();
  //       final XFile? image =
  //       await picker.pickImage(source: ImageSource.gallery);
  //       pickedFilePath = image?.path;
  //       break;
  //     case PickerActionType.video:
  //       final ImagePicker picker = ImagePicker();
  //       final XFile? video =
  //       await picker.pickVideo(source: ImageSource.gallery);
  //       pickedFilePath = video?.path;
  //       break;
  //     case PickerActionType.document:
  //       final picker = await FilePicker.platform.pickFiles(
  //         allowMultiple: false,
  //         allowedExtensions: ["pdf", "xlsx"],
  //         type: FileType.custom,
  //       );
  //       final XFile file = XFile(picker?.files.single.path ?? "");
  //       pickedFilePath = file.path;
  //       break;
  //     default:
  //       return null;
  //   }
  //   return pickedFilePath != null ? File(pickedFilePath) : null;
  // }

  static void showLog(String value) {
    log('\nLOG-Start***$value\nLOG-End***');
  }

  static Future<bool> checkInternet() async {
    try {
      final ConnectivityResult connectivityResult =
      await Connectivity().checkConnectivity();
      final bool result = connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi;
      return result;
    } on SocketException catch (_) {
      return false;
    }
  }

  static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      fontSize: FontSize.s16,
    );
  }

  static Widget showNoDataWidget({String? message}) {
    return Center(
      child: Text(
        message ?? AppStrings.kNoDataFound,
        // style: getBoldStyle(
        //   fontSize: FontSize.s20,
        //   color: Colors.black,
        // ),
      ),
    );
  }

  static getCustomFormattedDateTime({required String? givenDateTime}) {
    // dateFormat = 'MM/dd/yy';
    final DateTime docDateTime = DateTime.parse(givenDateTime ?? "");
    return DateFormat('dd/MM/yyyy, hh:mm a').format(docDateTime);
  }

  static String _getUrl() => Platform.isIOS ? '' : '';

  // static Future<void> openShare() async {
  //   await Share.share(
  //     'Hey, check out this APP name :\n${_getUrl()}',
  //     subject: 'APP Name', //Todo: change app name
  //   );
  // }

//** Checking vaidation for Image size for 5MB */
  static bool checkValidImageSizeIsLessThen5MB(File file) {
    final bytes = file.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return mb <= 5;
  }

  //** Check String in numeric or not */
  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  static String getDateFromMilliseconds(int seconds) {
    return DateFormat("dd MMM yyyy")
        .format(DateTime.fromMillisecondsSinceEpoch(seconds));
  }
}
