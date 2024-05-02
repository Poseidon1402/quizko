import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';

class GradientButton extends StatelessWidget {
  final List<Color> colors;
  final Widget? child;
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double fontSize;
  final FontWeight? fontWeight;
  final double elevation;

  const GradientButton({
    super.key,
    required this.colors,
    this.child,
    this.text = '',
    this.textColor,
    this.onPressed,
    this.borderRadius = 12.0,
    this.fontSize = 16.0,
    this.fontWeight,
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CustomElevatedButton(
        backgroundColor: Colors.transparent,
        onPressed: onPressed,
        elevation: elevation,
        child: child ?? Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
