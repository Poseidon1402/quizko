import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_color.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double? titleSize;
  final FontWeight? titleWeight;
  final bool initiallyExpanded;
  final List<Widget> children;

  const CustomExpansionTile({
    super.key,
    required this.title,
    this.titleColor,
    this.titleSize,
    this.titleWeight,
    this.initiallyExpanded = true,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: titleWeight ?? FontWeight.w700,
              fontSize: titleSize,
            ),
      ),
      initiallyExpanded: initiallyExpanded,
      iconColor: AppColor.white1,
      shape: const OutlineInputBorder(borderSide: BorderSide.none),
      children: children,
    );
  }
}
