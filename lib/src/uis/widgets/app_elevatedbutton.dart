import 'package:flutter/material.dart';

import '/src/resources/color_manager.dart';
import '/src/resources/value_manager.dart';

class AppElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.h50,
      width: AppWidth.w90Percent,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r6),
          ),
        ),
        child: child,
      ),
    );
  }
}
