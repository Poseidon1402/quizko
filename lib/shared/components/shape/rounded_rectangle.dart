import 'package:flutter/material.dart';

class RoundedRectangle extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxConstraints? constraints;
  final double borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final DecorationImage? backgroundImage;
  final BoxBorder? border;
  final Widget? child;

  const RoundedRectangle({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.constraints,
    this.borderRadius = 0.0,
    this.backgroundImage,
    this.border,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        image: backgroundImage,
        border: border,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
