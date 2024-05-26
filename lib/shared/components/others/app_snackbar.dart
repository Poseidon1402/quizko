import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_color.dart';

SnackBar myAppSnackBar(
    {required BuildContext context,
    required String message,
    required Color backgroundColor}) {
  return SnackBar(
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColor.white1,
          ),
    ),
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 5),
  );
}
