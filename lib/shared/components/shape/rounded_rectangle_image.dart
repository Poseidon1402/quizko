import 'package:flutter/material.dart';

class RoundedRectangleImage extends StatelessWidget {
  final ImageProvider image;
  final BoxFit fit;
  final BorderRadius customBorderRadius;

  const RoundedRectangleImage({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.customBorderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: customBorderRadius,
        image: DecorationImage(
          image: image,
          fit: fit,
        ),
      ),
    );
  }
}
