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
      padding: EdgeInsets.only(
          left: AppPadding.p20, right: AppPadding.p20, top: AppPadding.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Center(
                child: CircleAvatar(
                  radius: AppRadius.r23,
                  backgroundColor: ColorManager.scaffoldBg,
                  child: SvgPicture.asset(
                    assetName,
                    height: AppHeight.h20,
                  ),
                ),
              ),
              SizedBox(width: AppWidth.w15),
              Text(
                title,
                style: mediumTextStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.titleTextColor,
                  fontFamily: FontConstants.quicksand,
                ),
              ),
            ],
          ),
          Transform.scale(
            scale: 0.7,
            child: FlutterSwitch(
              value: value,
              onToggle: onToggle,
              activeColor: ColorManager.secondaryColor,
              inactiveColor: ColorManager.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
