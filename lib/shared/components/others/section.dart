import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String label;
  final double radiusTopRight;
  final double radiusTopLeft;
  final double radiusBottomLeft;
  final double radiusBottomRight;
  final bool selected;
  final bool showBorder;
  final VoidCallback? onTap;

  const Section({
    super.key,
    required this.label,
    this.radiusBottomLeft = 0,
    this.radiusBottomRight = 0,
    this.radiusTopLeft = 0,
    this.radiusTopRight = 0,
    this.selected = false,
    this.showBorder = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          // color: selected ? AppColor.yellow1 : AppColor.black3,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radiusTopLeft),
            topRight: Radius.circular(radiusTopRight),
            bottomLeft: Radius.circular(radiusBottomLeft),
            bottomRight: Radius.circular(radiusBottomRight),
          ),
          /*border: Border(
            // left: showBorder ? const BorderSide(color: AppColor.black5) : BorderSide.none,
            // right: showBorder ? const BorderSide(color: AppColor.black5) : BorderSide.none,
          )*/
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
