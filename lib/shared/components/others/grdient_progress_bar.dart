import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_color.dart';

class GradientProgressBar extends StatelessWidget {
  final double percentage;

  const GradientProgressBar({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55),
          border: Border.all(color: AppColor.white1.withOpacity(0.38)),
          color: AppColor.white1.withOpacity(0.06),
        ),
        child: FractionallySizedBox(
          widthFactor: percentage,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(55),
              gradient: const LinearGradient(
                colors: [
                  AppColor.blue5,
                  AppColor.green2,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
