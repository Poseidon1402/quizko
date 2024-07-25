import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/body/zero_items_body.dart';
import '../../../auth/presentation/bloc/authentication_bloc.dart';
import '../clip/header_painter.dart';

class NoQuizzesScreen extends StatelessWidget {
  const NoQuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser =
        (context.watch<AuthenticationBloc>().state as AuthenticatedState)
            .currentUser;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: currentUser.gender == 'masculine'
                ? const AssetImage('assets/images/male.jpg')
                : const AssetImage('assets/images/female.jpg'),
            backgroundColor: Colors.red,
            radius: 15.0,
          ),
        ),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Hi, ${currentUser.fullName}\n',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              TextSpan(
                text: currentUser.registrationNumber,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
        actions: [
          Image.asset('assets/logo/eni.png'),
          const Gap(10),
        ],
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: SizedBox(
          child: Stack(
            children: [
              CustomPaint(
                painter: HeaderPainter(),
                size: Size.fromHeight(MediaQuery.sizeOf(context).height * 0.4),
              ),
              _buildCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Positioned(
      top: 100,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              height: MediaQuery.sizeOf(context).height * 0.8,
              decoration: BoxDecoration(
                color: AppColor.blue3,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 3,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: SvgPicture.asset(
                            'assets/images/circle.svg',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Stars.png',
                              width: 51.w,
                              height: 51.w,
                            ),
                            const Gap(20),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '150\n',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                  ),
                                  TextSpan(
                                    text: 'Total points',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset(
                          'assets/images/circle.svg',
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints.expand(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const ZeroItemsBody(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
