import 'package:flutter/material.dart';

SnackBar myAppSnackBar({required BuildContext context, required String message, required Color backgroundColor}) {
  return SnackBar(
    content: Text(message, style: Theme.of(context).textTheme.bodyMedium,),
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 5),
  );
}