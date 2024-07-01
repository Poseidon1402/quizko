import 'package:flutter/material.dart';

import '../../../../core/utils/colors/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.purple3,
      child: Center(
        child: FractionallySizedBox(
          heightFactor: 0.6,
          child: Image.asset('assets/logo/logo_splash.png'),
        ),
      ),
    );
  }
}
