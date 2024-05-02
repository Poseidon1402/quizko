import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LabeledIcon extends StatelessWidget {
  final String label;
  final String icon;
  final double? labelSize;
  final Color? labelColor;
  final ColorFilter? iconColor;
  final MainAxisAlignment mainAxisAlignment;

  const LabeledIcon({
    super.key,
    required this.icon,
    required this.label,
    this.labelSize,
    this.labelColor,
    this.iconColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Flexible(
          child: SvgPicture.asset(
            icon,
            colorFilter: iconColor,
            width: 20,
            height: 20,
          ),
        ),
        const Gap(5),
        Flexible(
          flex: 3,
          child: Text(
            label,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: labelSize,
                  color: labelColor,
                ),
          ),
        ),
      ],
    );
  }
}
