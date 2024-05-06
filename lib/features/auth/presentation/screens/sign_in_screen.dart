import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:quizko/core/utils/colors/app_color.dart';

import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        padding: const EdgeInsets.symmetric(horizontal: 40),
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
                            hintText: 'Registration number or email',
                            keyboardType: TextInputType.emailAddress,
                            validator: isEmail,
                            textInputAction: TextInputAction.done,
                            borderRadius: 24.0,
                          ),
                          const Gap(20),
                          const CustomTextFormField(
                            hintText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            validator: isRequired,
                            textInputAction: TextInputAction.done,
                            borderRadius: 24.0,
                          ),
                          const Gap(10),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot password ?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColor.purple1),
                              ),
                            ),
                          ),
                          const Gap(10),
                          CustomElevatedButton(
                            onPressed: () {},
                            borderRadius: 24.0,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Copyright ${DateTime.now().year} ©',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 100,
                right: -200,
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
