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
  final String? labelText;
  final InputBorder? border;
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
    this.labelText,
    this.border,
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
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r8),
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
        style: mediumTextStyle(
          fontSize: FontSize.s16,
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
          labelStyle: regularTextStyle(
            color: ColorManager.buttonGreyText,
            fontFamily: FontConstants.quicksand,
            fontSize: FontSize.s16,
          ),
          border: border ?? InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              vertical: AppPadding.p12, horizontal: AppPadding.p15),
        ),
      ),
    );
  }
}
