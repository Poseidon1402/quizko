import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_color.dart';

class SelectField extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final dynamic value;
  final void Function(dynamic)? onChanged;
  final IconData icon;
  final Color? iconColor;
  final Color filledColor;
  final double? iconSize;
  final double borderRadius;
  final Color textColor;
  final double dropdownBorderRadius;
  final int elevation;
  final Color dropdownColor;
  final String? Function(dynamic)? validator;
  final String? hintText;
  final bool enabled;
  final Color fontColor;
  final EdgeInsetsGeometry? contentPadding;

  const SelectField({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.icon = Icons.arrow_drop_down,
    this.iconColor = AppColor.grey1,
    this.filledColor = AppColor.white2,
    this.iconSize,
    this.enabled = true,
    this.borderRadius = 16,
    this.textColor = AppColor.grey1,
    this.dropdownBorderRadius = 16,
    this.elevation = 0,
    this.validator,
    this.dropdownColor = AppColor.white1,
    this.hintText,
    this.fontColor = AppColor.grey1,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      validator: validator,
      elevation: elevation,
      icon: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      borderRadius: BorderRadius.circular(dropdownBorderRadius),
      dropdownColor: dropdownColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: fontColor,
        ),
        enabled: enabled,
        contentPadding: contentPadding,
        filled: true,
        fillColor: filledColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: AppColor.red1,
          ),
        ),
        errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColor.red1,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: AppColor.red1,
          ),
        ),
      ),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: textColor,
          ),
      items: items,
      onChanged: onChanged,
    );
  }
}
