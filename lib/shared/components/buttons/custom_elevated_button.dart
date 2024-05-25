import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double elevation;
  final Color? backgroundColor;
  final double horizontalPadding;
  final OutlinedBorder? shape;
  final double verticalPadding;

  const CustomElevatedButton({
    super.key,
    required this.child,
    this.onPressed,
    this.borderRadius = 12.0,
    this.elevation = 0.0,
    this.backgroundColor,
    this.horizontalPadding = 20.0,
    this.verticalPadding = 15.0,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        surfaceTintColor: backgroundColor,
        shadowColor: backgroundColor,
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        elevation: elevation,
      ),
      child: child,
    );
  }
}
