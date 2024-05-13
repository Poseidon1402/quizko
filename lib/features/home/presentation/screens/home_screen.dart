import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../clip/header_painter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logo/logo_white1.png'),
            backgroundColor: Colors.red,
            radius: 15.0,
          ),
        ),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Hi, John Doe\n',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              TextSpan(
                text: '@johndoe',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          children: [
            CustomPaint(
              painter: HeaderPainter(),
              size: Size.fromHeight(MediaQuery.sizeOf(context).height * 0.4),
            ),
            Positioned(
              top: 100,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      height: 400.h,
                      decoration: BoxDecoration(
                        color: AppColor.blue3,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/Stars.png', width: 51.w, height: 51.w,),
                                const Gap(20),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '150\n',
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: Theme.of(context).colorScheme.onPrimary
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Total points',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: Theme.of(context).colorScheme.onPrimary
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Today’s Quiz on',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    Text(
                                      'Global Knowledge',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
