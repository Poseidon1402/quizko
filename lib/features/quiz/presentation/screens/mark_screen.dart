import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';

class MarkScreen extends StatelessWidget {
  final int mark;

  const MarkScreen({
    super.key,
    required this.mark,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        leading: IconButton.outlined(
          onPressed: () => context.go(Routes.home),
          style: IconButton.styleFrom(
              side: BorderSide(color: Colors.white.withOpacity(0.18)),
              padding: const EdgeInsets.all(10)),
          icon: SvgPicture.asset('assets/icons/home_2.svg'),
        ),
        title: Text(
          'Quiz result',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          children: [
            Center(
              child: Container(
                constraints: BoxConstraints.tightFor(
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                ),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColor.blue2,
                      AppColor.purple3,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Congratulations !\n',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: AppColor.white1,
                                ),
                          ),
                          TextSpan(
                            text: "You've scored ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColor.white1,
                                ),
                          ),
                          TextSpan(
                            text: "+$mark ",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColor.green2,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          TextSpan(
                            text: "points",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColor.white1,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '$mark',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: 44.sp,
                                      color: AppColor.green2,
                                    ),
                              ),
                              TextSpan(
                                text: '/20',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: 44.sp,
                                      color: AppColor.white1,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.95,
                      child: CustomElevatedButton(
                        onPressed: () => context.go(Routes.home),
                        borderRadius: 24,
                        child: Text(
                          'Done',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset('assets/images/trophy.png'),
          ],
        ),
      ),
    );
  }
}
