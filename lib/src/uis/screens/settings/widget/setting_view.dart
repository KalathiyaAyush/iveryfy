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
      padding: EdgeInsets.only(
          bottom: AppPadding.p15, left: AppPadding.p20, right: AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: AppWidth.w45,
                  height: AppHeight.h40,
                  decoration: BoxDecoration(
                      color: ColorManager.scaffoldBg,
                      borderRadius: BorderRadius.circular(AppRadius.r20),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8.0,
                          spreadRadius: 2.0,
                          offset: Offset(5.0, 5.0),
                          color: Color.fromRGBO(39, 34, 70, 0.1),
                        ),
                      ]),
                  child: Center(
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
