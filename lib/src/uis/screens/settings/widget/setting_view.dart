import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '/src/resources/color_manager.dart';
import '/src/resources/font_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/value_manager.dart';

class SettingView extends StatelessWidget {
  final String asset;
  final String assetName;
  final String title;
  final Function()? onTap;
  const SettingView({
    super.key,
    required this.assetName,
    required this.asset,
    required this.title,
    this.onTap,
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
                  child: FittedBox(
                    child: SvgPicture.asset(
                      assetName,
                    ),
                  ),
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
          IconButton(
            onPressed: onTap,
            icon: SvgPicture.asset(
              asset,
              height: AppHeight.h13,
            ),
          )
        ],
      ),
    );
  }
}
