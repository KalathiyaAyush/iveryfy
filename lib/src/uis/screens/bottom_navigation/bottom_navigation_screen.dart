// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/src/resources/color_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/assets_manager.dart';

import '/src/uis/screens/home/home_screen.dart';
import '/src/uis/screens/settings/setting_screen.dart';
import '/src/uis/screens/documents/document_screen.dart';
import '/src/uis/screens/connections/connection_screen.dart';

class BottomNavigationbarScreen extends StatefulWidget {
  const BottomNavigationbarScreen({super.key});

  @override
  State<BottomNavigationbarScreen> createState() =>
      _BottomNavigationbarScreenState();
}

class _BottomNavigationbarScreenState extends State<BottomNavigationbarScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const MyDocumentScreen(),
    const ConnectionScreen(),
    const SettingsScreen(),
  ];

  // ignore: unused_element
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBg,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: AppPadding.p20,
            right: AppPadding.p20,
            bottom: AppPadding.p30),
        child: Container(
          height: AppHeight.h70,
          width: AppWidth.w300,
          padding: EdgeInsets.only(left: AppPadding.p30, right: AppPadding.p30),
          decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius: BorderRadius.circular(AppRadius.r30),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(39, 34, 70, 0.1),
                  blurRadius: 12,
                  offset: Offset(0, 8),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                icon: SvgPicture.asset(
                  _selectedIndex == 0
                      ? ImageAssets.homeFilledIcon
                      : ImageAssets.homeIcon,
                  color: ColorManager.scaffoldBg,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                icon: SvgPicture.asset(
                  _selectedIndex == 1
                      ? ImageAssets.docFilledIcon
                      : ImageAssets.docIcon,
                  color: ColorManager.scaffoldBg,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                icon: SvgPicture.asset(
                  _selectedIndex == 2
                      ? ImageAssets.connectionFilledIcon
                      : ImageAssets.connectionIcon,
                  color: ColorManager.scaffoldBg,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                icon: SvgPicture.asset(
                  _selectedIndex == 3
                      ? ImageAssets.settingsFilledIcon
                      : ImageAssets.settingsIcon,
                  color: ColorManager.scaffoldBg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  // Padding(
        //   padding: EdgeInsets.only(
        //       left: AppPadding.p20,
        //       right: AppPadding.p20,
        //       bottom: AppPadding.p30),
        //   child: Container(
        //     height: AppHeight.h70,
        //     width: AppWidth.w300,
        //     padding: EdgeInsets.only(left: AppPadding.p30, right: AppPadding.p30),
        //     decoration: BoxDecoration(
        //       color: ColorManager.secondaryColor,
        //       borderRadius: BorderRadius.circular(AppRadius.r30),
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: const [
        //         Icon(Icons.home_sharp, color: ColorManager.scaffoldBg),
        //         Icon(Icons.folder_open_outlined, color: ColorManager.scaffoldBg),
        //         Icon(Icons.group_outlined, color: ColorManager.scaffoldBg),
        //         Icon(Icons.settings_outlined, color: ColorManager.scaffoldBg),
        //       ],
        //     ),
        //   ),
        // ),


  // Padding(
      //   padding: EdgeInsets.only(
      //       left: AppPadding.p20,
      //       right: AppPadding.p20,
      //       bottom: AppPadding.p30),
      //   child: BottomNavigationBar(
      //     backgroundColor: ColorManager.secondaryColor,
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: ''),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.folder_open_outlined), label: ''),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.group_outlined), label: ''),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.settings_outlined), label: ''),
      //     ],
      //     currentIndex: _selectedIndex,
      //     onTap: _onItemTap,
      //     showUnselectedLabels: true,
      //     showSelectedLabels: true,
      //     type: BottomNavigationBarType.fixed,
      //     elevation: 4,
      //     selectedItemColor: ColorManager.scaffoldBg,
      //     unselectedItemColor: ColorManager.scaffoldBg,
      //   ),
      // ),