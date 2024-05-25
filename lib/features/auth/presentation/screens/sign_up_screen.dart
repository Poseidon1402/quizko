import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
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
                        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                          const CustomTextFormField(
                            hintText: 'Registration number',
                            keyboardType: TextInputType.emailAddress,
                            validator: isEmail,
                            textInputAction: TextInputAction.done,
                            borderRadius: 24.0,
                          ),
                          const Gap(20),
                          const CustomTextFormField(
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: isEmail,
                            textInputAction: TextInputAction.done,
                            borderRadius: 24.0,
                          ),
                          const Gap(20),
                          const CustomTextFormField(
                            hintText: 'Phone',
                            keyboardType: TextInputType.phone,
                            validator: isEmail,
                            textInputAction: TextInputAction.done,
                            borderRadius: 24.0,
                          ),
                          const Gap(20),
                          const CustomTextFormField(
                            hintText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            validator: isRequired,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            borderRadius: 24.0,
                          ),
                          const Gap(40),
                          CustomElevatedButton(
                            onPressed: () => context.go(Routes.home),
                            borderRadius: 24.0,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                          ),
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
                              text: 'Already have an account ? ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                            TextSpan(
                              text: 'Sign in',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.go(Routes.login),
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
