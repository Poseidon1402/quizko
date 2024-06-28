import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/utils/services/injections.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/others/app_snackbar.dart';
import '../../domain/usecases/forgot_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          children: [
                            SvgPicture.asset('assets/logo/logo_2.svg'),
                            const Gap(50),
                            Align(
                              alignment: Alignment.topLeft,
                              child: IconButton.outlined(
                                onPressed: () => context.pop(),
                                style: IconButton.styleFrom(
                                    shape: const CircleBorder(),
                                    side: BorderSide(
                                      color: AppColor.purple1.withOpacity(0.18),
                                    ),
                                    padding: const EdgeInsets.all(10)),
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20,
                                  color: AppColor.purple1,
                                ),
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
                            CustomTextFormField(
                              controller: _emailController,
                              prefixIcon: const Icon(
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
                              onPressed: _onButtonTapped,
                              borderRadius: 24.0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              child: _isLoading
                                  ? const SpinKitWave(
                                      color: AppColor.white1,
                                      size: 20,
                                    )
                                  : Text(
                                      'Reset password',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                    ),
                            ),
                          ],
                        ),
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
                left: -200,
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

  void _onButtonTapped() async {
    if(_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final result = await sl<ForgotPassword>().call(_emailController.text);

      result.fold(
            (failure) => ScaffoldMessenger.of(context).showSnackBar(
          myAppSnackBar(
            context: context,
            message: failure.message,
            backgroundColor: AppColor.red1,
          ),
        ),
            (success) => context.pushReplacement(Routes.createNewPassword),
      );

      setState(() => _isLoading = false);
    }
  }
}
