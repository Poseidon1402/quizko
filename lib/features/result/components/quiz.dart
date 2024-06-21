import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/colors/app_color.dart';
import '../../../core/utils/constants/routes.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.userAnswer),
      child: Padding(
        padding: const EdgeInsets.all(10),
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
            const Gap(10),
            Expanded(
              flex: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Information Technology\n',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: '20 Questions | Quiz',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Chip(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
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
                      Chip(
                        backgroundColor: AppColor.green1,
                        avatar: const Icon(
                          Icons.check,
                          size: 16,
                          color: AppColor.white1,
                        ),
                        label: Text(
                          '10',
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
                      Chip(
                        backgroundColor: AppColor.red3,
                        avatar: const Icon(
                          Icons.check,
                          size: 16,
                          color: AppColor.white1,
                        ),
                        label: Text(
                          '4',
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
                      Text(
                        '50 pts',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColor.green1,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.purple3,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}