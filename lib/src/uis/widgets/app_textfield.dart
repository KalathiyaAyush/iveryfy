import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/src/resources/font_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/value_manager.dart';

class AppTextField extends StatelessWidget {
  final bool isEnabled;
  final int maxLine;
  final bool isPassword;
  final bool isPasswordVisible;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final TextStyle? style;
  final String? labelText;
  final InputBorder? border;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? initialValue;
  final Function()? onTap;
  final bool obscureText;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableInteractiveSelection;

  const AppTextField({
    super.key,
    this.isEnabled = true,
    this.maxLine = 1,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.autovalidateMode,
    this.suffix,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixText,
    this.suffixStyle,
    this.style,
    this.labelText,
    this.border,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.initialValue,
    this.onTap,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.maxLength,
    this.controller,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h55,
      width: AppWidth.w90Percent,
      padding: EdgeInsets.only(top: AppPadding.p8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r6),
          border: Border.all(
            color: ColorManager.primaryColor,
          )),
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        readOnly: !isEnabled,
        enableInteractiveSelection: enableInteractiveSelection,
        initialValue: initialValue,
        onTap: onTap,
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLine,
        style: style ??
            regularTextStyle(
              fontSize: FontSize.s14,
              color: ColorManager.textColor,
              fontFamily: FontConstants.quicksand,
            ),
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
        textInputAction: textInputAction,
        focusNode: focusNode,
        maxLength: maxLength,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          suffix: suffix,
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
          suffixText: suffixText,
          suffixStyle: suffixStyle,
          labelText: labelText,
          labelStyle: labelStyle,
          border: border ?? InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: AppPadding.p12, top: AppPadding.p10),
        ),
      ),
    );
  }
}
