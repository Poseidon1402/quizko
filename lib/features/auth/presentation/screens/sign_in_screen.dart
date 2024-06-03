import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quizko/core/utils/colors/app_color.dart';

import '../../../../core/utils/constants/routes.dart';
import '../partials/login_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(automaticallyImplyLeading: false,),
      backgroundColor: AppColor.purple3,
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Form(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.white1,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(150),
                          bottomLeft: Radius.circular(32),
                        ),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          SvgPicture.asset('assets/logo/logo_2.svg'),
                          const Gap(50),
                          Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            'To continue, please login to your account',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Gap(30),
                          const LoginForm(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account ? ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                color:
                                Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign up',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.push(Routes.subscribe),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                color: AppColor.purple2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 100,
                right: -170,
                child: Image.asset(
                  'assets/images/cubic.png',
                  width: 300.w,
                  height: 300.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
