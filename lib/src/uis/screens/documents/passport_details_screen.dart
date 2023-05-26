// ignore_for_file: unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:iverify/src/resources/assets_manager.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/routes_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/uis/widgets/appbar_widget.dart';
import '/src/uis/screens/documents/widgets/document_card.dart';

class PassportDetailScreen extends StatefulWidget {
  const PassportDetailScreen({super.key});

  @override
  State<PassportDetailScreen> createState() => _PassportDetailScreenState();
}

class _PassportDetailScreenState extends State<PassportDetailScreen> {
  final List<String> _selectedItems = [];

  final List<String> tagsList = [
    AppStrings.kIDProof,
    AppStrings.kTravel,
    AppStrings.kPersonal,
    AppStrings.kInsurance,
    AppStrings.kEducation,
  ];
  bool isDropdownOpen = false;
  void _showMultiSelect() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  void _itemChange(String tagValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(tagValue);
      } else {
        _selectedItems.remove(tagValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime(2023, 5, 17);
    var newDate = DateTime(date.year, date.month + 3, date.day);
    print(newDate);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppHeight.h20),
          AppbarWidget(onbackTap: () {
            Navigator.of(context).pop();
          }),
          Padding(
            padding:
                EdgeInsets.only(right: AppPadding.p10, left: AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.kPassportDetails,
                  style: mediumTextStyle(
                    fontSize: FontSize.s24,
                    color: ColorManager.titleTextColor,
                    fontFamily: FontConstants.rubik,
                  ),
                ),
                SizedBox(height: AppHeight.h4),
                Text(
                  'Uploaded on 12 Jun 2023, 12:00:30',
                  style: mediumTextStyle(
                    fontSize: FontSize.s18,
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
              // shrinkWrap: true,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        AppStrings.kQrCode,
                        style: mediumTextStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.titleTextColor,
                          fontFamily: FontConstants.rubik,
                        ),
                      ),
                      QrImageView(
                        data: 'Happy Codding!!',
                        version: QrVersions.auto,
                        size: AppSize.s150,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppHeight.h25),
                Padding(
                  padding: EdgeInsets.only(
                      right: AppPadding.p10, left: AppPadding.p15),
                  child: DocumentCard(
                    onTap: () {
                      // Navigator.of(context)
                      //     .pushNamed(AppRoutes.myDocumentsScreen);
                    },
                    assetName: ImageAssets.dropdownIcon,
                    children: _selectedItems
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(right: AppPadding.p3),
                            child: Container(
                              width: AppWidth.w43,
                              height: AppHeight.h16,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(235, 235, 235, 1),
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r10),
                              ),
                              child: Center(
                                child: Text(
                                  e,
                                  style: regularTextStyle(
                                    fontSize: FontSize.s10,
                                    color: ColorManager.titleTextColor,
                                    fontFamily: FontConstants.quicksand,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: AppHeight.h10),
                Padding(
                  padding: EdgeInsets.only(
                      right: AppPadding.p15, left: AppPadding.p15),
                  child: Container(
                    width: AppWidth.w330,
                    height: AppHeight.h45,
                    padding: EdgeInsets.only(left: AppPadding.p15),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primaryColor),
                      borderRadius: BorderRadius.circular(AppRadius.r6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextFormField(
                            style: regularTextStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.textColor,
                              fontFamily: FontConstants.quicksand,
                            ),
                            enabled: false,
                            controller: TextEditingController(
                                text: _selectedItems.join(" & ")),
                            decoration: const InputDecoration(
                              labelText: AppStrings.kSelectTags,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: _showMultiSelect,
                          icon: SvgPicture.asset('lib/assets/svg/dropdown.svg'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppHeight.h5),
                isDropdownOpen
                    ? Padding(
                        padding: EdgeInsets.only(bottom: AppPadding.p10),
                        child: Column(
                          children: [
                            Container(
                              width: AppWidth.w330,
                              height: AppHeight.h180,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(227, 227, 227, 1)),
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r6),
                              ),
                              child: MediaQuery.removePadding(
                                context: context,
                                removeBottom: true,
                                removeTop: true,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: tagsList
                                      .map(
                                        (tag) => CheckboxListTile(
                                          title: Text(tag),
                                          dense: true,
                                          side: const BorderSide(
                                              color: ColorManager.primaryColor),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0),
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor:
                                              ColorManager.secondaryColor,
                                          value: _selectedItems.contains(tag),
                                          onChanged: (isChecked) =>
                                              _itemChange(tag, isChecked!),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
