import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_color.dart';

class AppCheckbox extends StatelessWidget {
  final bool? checked;
  final String label;
  final Color? fontColor;
  final Function(bool?)? onChanged;
  final Color checkColor;
  final Widget? text;

  const AppCheckbox({
    super.key,
    this.onChanged,
    this.checked = false,
    this.label = '',
    this.fontColor,
    this.text,
    this.checkColor = AppColor.white1,
  });

  @override
  Widget build(BuildContext context) {

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Checkbox(
          value: checked,
          onChanged: onChanged,
          checkColor: checkColor,
          activeColor: AppColor.orange1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        text ?? Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: fontColor ?? AppColor.white1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}