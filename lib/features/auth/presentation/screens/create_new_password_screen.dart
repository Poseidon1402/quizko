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
import '../../domain/usecases/reset_password.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  final String email;
  final String token;

  const CreateNewPasswordScreen({
    super.key,
    required this.email,
    required this.token,
  });

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

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
          key: _formKey,
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
                          GestureDetector(
                            onTap: () => context.pop(),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                alignment: Alignment.center,
                                height: 46,
                                width: 46,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color:
                                          AppColor.purple1.withOpacity(0.18)),
                                ),
                                child: const Icon(Icons.arrow_back_ios_rounded),
                              ),
                            ),
                          ),
                          const Gap(40),
                          Text(
                            'Create New Password',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppColor.purple1,
                                ),
                          ),
                          Text(
                            'Please create a new password. We recommend you to not use same password as previous',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Gap(30),
                          CustomTextFormField(
                            controller: _passwordController,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: AppColor.grey1,
                            ),
                            obscureText: true,
                            hintText: 'New password',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => length(value, min: 6),
                            textInputAction: TextInputAction.done,
                            borderRadius: 24.0,
                          ),
                          const Gap(20),
                          CustomTextFormField(
                            controller: _passwordConfirmationController,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: AppColor.grey1,
                            ),
                            obscureText: true,
                            validator: (value) => isTheSamePassword(
                              _passwordController.text,
                              value ?? '',
                            ),
                            hintText: 'Confirm new password',
                            keyboardType: TextInputType.emailAddress,
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
                                    size: 20,
                                    color: AppColor.white1,
                                  )
                                : Text(
                                    'Confirm',
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

  void _onButtonTapped() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final result = await sl<ResetPassword>().call(
        widget.email,
        widget.token,
        _passwordController.text,
      );

      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(
          myAppSnackBar(
            context: context,
            message: failure.message,
            backgroundColor: AppColor.red1,
          ),
        ),
        (success) => context.go(Routes.login),
      );

      setState(() => _isLoading = false);
    }
  }
}
