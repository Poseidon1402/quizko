import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredCircleShape extends StatelessWidget {
  const BlurredCircleShape({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 130,
        sigmaY: 130,
        tileMode: TileMode.decal,
      ),
      /*child: CircleAvatar(
        //backgroundColor: AppColor.yellow1.withOpacity(0.8),
        radius: 150,
      ),*/
    );
  }
}