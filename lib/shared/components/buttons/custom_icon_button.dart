import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_color.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double borderRadius;
  final Color? backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onPressed;
  final OutlinedBorder? shape;
  final double? iconSize;

  const CustomIconButton({
    super.key,
    this.icon = Icons.add,
    required this.onPressed,
    this.iconColor = AppColor.grey1,
    this.backgroundColor,
    this.padding,
    this.borderRadius = 0.0,
    this.shape,
    this.iconSize,
    this.child,

  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      icon: child ?? Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
