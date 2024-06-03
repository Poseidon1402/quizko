import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';

class BottomAppBarItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomAppBarItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: isSelected ? const BorderSide(color: AppColor.purple3, width: 3) : BorderSide.none,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/${isSelected ? icon : '${icon}_outlined'}.svg',
              ),
              const Gap(10),
              Visibility(
                visible: isSelected,
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
