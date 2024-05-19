import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 27.5,
            spreadRadius: 3,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 74.w,
            height: 74.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [
                  AppColor.purple3,
                  AppColor.purple4,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SvgPicture.asset('assets/logo/logo_white2.svg'),
          ),
          const Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Quiz 1\n',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      TextSpan(
                        text: '20 Questions  |  Quiz',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black.withOpacity(0.45),
                            ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Chip(
                      elevation: 0.0,
                      backgroundColor: Colors.white,
                      avatar: SvgPicture.asset('assets/icons/clock.svg'),
                      label: Text(
                        '01:20',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.black.withOpacity(0.45)),
                      ),
                      side: BorderSide.none,
                    ),
                    const Gap(10),
                    Chip(
                      backgroundColor: AppColor.green1,
                      avatar: const Icon(
                        Icons.check,
                        size: 16,
                        color: AppColor.white1,
                      ),
                      label: Text(
                        'Completed',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      side: BorderSide.none,
                      elevation: 0.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColor.purple3,
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}
