import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';
import '/src/resources/string_manager.dart';
import '/src/resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    var duration = const Duration(seconds: 3);
    return Timer(
      duration,
      () {
        AppRoutes.popUntil(
          context,
          name: AppRoutes.welcomeScreen,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('lib/assets/svg/splash_icon.svg'),
            SizedBox(height: AppHeight.h15),
            Text(
              AppStrings.kiverify,
              style: regularTextStyle(
                fontSize: FontSize.s50,
                color: ColorManager.secondaryColor,
                fontFamily: FontConstants.rubik,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
