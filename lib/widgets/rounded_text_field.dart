import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../themes/app_text_theme.dart';
import '../themes/theme_color.dart';

class RoundedTextField extends StatelessWidget{
  final String? hintText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? textEditingController;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool? isReadOnly;
  final bool? isObscureText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final GestureTapCallback? onTap;
  final double? radius;

  const RoundedTextField({
    Key? key,
    this.onTap,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.textEditingController,
    this.prefixIcon,
    this.sufixIcon,
    this.isReadOnly,
    this.isObscureText,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.contentPadding,
    this.radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: textEditingController,
      style: style600_14(color: primaryColor),
      readOnly: isReadOnly??false,
      obscureText: isObscureText??false,
      onChanged: onChanged,
      cursorColor: primaryColor,
      maxLength: maxLength,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??30),
              borderSide: const BorderSide(
                color: primaryColor,
                width: 2,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??30),
              borderSide: const BorderSide(
                color: primaryColor,
                width: 2,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??30),
              borderSide: const BorderSide(
                color: red_2,
                width: 2,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius??30),
              borderSide: const BorderSide(
                color: primaryColor,
                width: 2,
              )),
          contentPadding: contentPadding??const EdgeInsets.symmetric(
              horizontal: 20, vertical: 15),
          counterText: "",
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
          errorStyle: style600_10(color: red_2),
          errorText: errorText,
          labelStyle: style500_14(color: primaryColorLight),
          labelText: hintText),
    );
  }

}