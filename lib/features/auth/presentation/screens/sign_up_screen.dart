import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/utils/constants/widget_keys.dart';
import '../partials/subscription_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      key: WidgetKeys.signUpScreenKey,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton.outlined(
          onPressed: () => context.pushReplacement(Routes.login),
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            side: BorderSide(
              color: AppColor.purple1.withOpacity(0.18),
            ),
            padding: const EdgeInsets.all(10),
          ),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColor.purple1,
          ),
        ),
      ),
      backgroundColor: AppColor.white1,
      resizeToAvoidBottomInset: false,
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: ListView(
          padding: EdgeInsets.only(
            bottom: bottomInset,
            left: 10,
            right: 10,
          ),
          children: [
            const Gap(20),
            SvgPicture.asset('assets/logo/logo_2.svg'),
            const Gap(50),
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Text(
              'To continue, please create your account',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Gap(30),
            const SubscriptionForm(),
          ],
        ),
      ),
    );
  }
}
