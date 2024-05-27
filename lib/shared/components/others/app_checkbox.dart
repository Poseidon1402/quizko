import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_color.dart';

class AppCheckbox extends StatelessWidget {
  final bool checked;
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

    return GestureDetector(
      onTap: () => onChanged!(!checked),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: checked ? Colors.transparent : AppColor.white2,
          border: checked ? Border.all(
            color: AppColor.purple3.withOpacity(0.53),
            width: 1,
          ) : null,
          borderRadius: BorderRadius.circular(49),
        ),
        child: Row(
          children: [
            Expanded(
              child: text ?? Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: fontColor ?? Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Checkbox(
              value: checked,
              onChanged: onChanged,
              checkColor: checkColor,
              activeColor: AppColor.purple3,
              shape: const CircleBorder(),
            ),
          ],
        ),
      ),
    );
  }
}