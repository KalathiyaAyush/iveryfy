import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/src/resources/value_manager.dart';

class AppbarWidget extends StatelessWidget {
  final Function()? onbackTap;
  final Function()? onPressed;
  final Widget? icon;
  const AppbarWidget(
      {super.key, required this.onbackTap, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onbackTap,
            child: SvgPicture.asset('lib/assets/svg/back_arrow.svg'),
          ),
          IconButton(
            onPressed: onPressed,
            icon: icon ?? Container(),
          ),
        ],
      ),
    );
  }
}
