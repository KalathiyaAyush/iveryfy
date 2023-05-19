import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '/src/resources/color_manager.dart';
import '/src/resources/font_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';

class SettingSwitchView extends StatelessWidget {
  final String asset;
  final String assetName;
  final String title;
  final bool value;
  final Function(bool) onToggle;
  const SettingSwitchView({
    super.key,
    required this.assetName,
    required this.asset,
    required this.title,
    required this.value,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: AppHeight.h42,
                width: AppWidth.w45,
                child: NeumorphicButton(
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    color: ColorManager.scaffoldBg,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(AppRadius.r25),
                    ),
                  ),
                  child: SvgPicture.asset(assetName),
                ),
              ),
              SizedBox(width: AppWidth.w15),
              Text(
                title,
                style: mediumTextStyle(
                  fontSize: FontSize.s18,
                  color: ColorManager.titleTextColor,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ],
          ),
          FlutterSwitch(
            width: AppWidth.w52,
            height: AppHeight.h24,
            toggleSize: AppSize.s18,
            value: value,
            onToggle: onToggle,
            activeColor: ColorManager.secondaryColor,
            inactiveColor: ColorManager.primaryColor,
          ),
        ],
      ),
    );
  }
}
