import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final Color? backgroundColor;
  final Color? hintTextColor;
  final TextEditingController? controller;
  final String hintText;
  final TextStyle? hintTextStyle;
  final double borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final bool filled;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool showCursor;
  final int? maxLines;
  final int? minLines;
  final BorderSide? focusedBorderSide;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final VoidCallback? onCompleteEditing;

  const CustomTextFormField({
    super.key,
    this.backgroundColor,
    this.hintTextColor,
    this.contentPadding,
    this.readOnly = false,
    this.showCursor = true,
    this.controller,
    this.hintText = '',
    this.hintTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.borderRadius = 16,
    this.onTap,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.filled = true,
    this.focusedBorderSide,
    this.focusNode,
    this.textInputAction,
    this.onCompleteEditing,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      style: Theme.of(context).textTheme.bodySmall,
      maxLines: maxLines,
      obscureText: obscureText,
      onTap: onTap,
      minLines: minLines,
      validator: validator,
      readOnly: readOnly,
      showCursor: showCursor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onEditingComplete: onCompleteEditing,
      onChanged: onChanged,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintStyle: hintTextStyle ?? Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: hintTextColor),
        hintText: hintText,
        filled: filled,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: focusedBorderSide ?? const BorderSide(
            color: AppColor.red1,
          ),
        ),
        errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColor.red1,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: focusedBorderSide ?? const BorderSide(
            color: AppColor.red1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: focusedBorderSide ?? const BorderSide(
            color: AppColor.yellow1,
          ),
        ),
        contentPadding: contentPadding,
      ),
    );
  }
}
