import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
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
                          bottomRight: Radius.circular(32),
                          bottomLeft: Radius.circular(150),
                        ),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        children: [
                          SvgPicture.asset('assets/logo/logo_2.svg'),
                          const Gap(50),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              alignment: Alignment.center,
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColor.purple1.withOpacity(0.18)),
                              ),
                              child: const Icon(Icons.arrow_back_ios_rounded),
                            ),
                          ),
                          const Gap(40),
                          Text(
                            'Forgot password',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppColor.purple1,
                                ),
                          ),
                          Text(
                            'Enter your email address to get an OTP code to reset your password.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Gap(30),
                          const CustomTextFormField(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: AppColor.grey1,
                            ),
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: isEmail,
                            textInputAction: TextInputAction.done,
                            borderRadius: 24.0,
                          ),
                          Gap(100.h),
                          CustomElevatedButton(
                            onPressed: () {},
                            borderRadius: 24.0,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              'Reset password',
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
                bottom: 10,
                left: -260,
                child: Image.asset(
                  'assets/images/ring.png',
                  width: 275.w,
                  height: 275.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
