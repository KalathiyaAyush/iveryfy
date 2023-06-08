import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  const AppTextButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
