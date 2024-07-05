import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quizko/core/validator/form_validators.dart';
import 'package:quizko/features/auth/domain/usecases/verify_reset_code.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/utils/services/injections.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/others/app_snackbar.dart';

class ForgotPasswordVerificationCodeScreen extends StatefulWidget {
  final String email;

  const ForgotPasswordVerificationCodeScreen({
    super.key,
    required this.email,
  });

  @override
  State<ForgotPasswordVerificationCodeScreen> createState() =>
      _ForgotPasswordVerificationCodeScreenState();
}

class _ForgotPasswordVerificationCodeScreenState
    extends State<ForgotPasswordVerificationCodeScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

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
                              'Verification code',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColor.purple1,
                                  ),
                            ),
                            Text(
                              'Enter the verification code that has been sent to your mailbox',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const Gap(30),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: PinCodeTextField(
                                appContext: context,
                                pastedTextStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                                length: 6,
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                validator: (value) => length(value, min: 6),
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.underline,
                                    selectedColor: AppColor.purple1),
                                cursorColor: Colors.black,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                controller: _codeController,
                                keyboardType: TextInputType.text,
                                boxShadows: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  )
                                ],
                                onCompleted: (v) => _onButtonTapped(),
                              ),
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
                                      'Verify',
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
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final result =
          await sl<VerifyResetCode>().call(widget.email, _codeController.text);

      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(
          myAppSnackBar(
            context: context,
            message: failure.message,
            backgroundColor: AppColor.red1,
          ),
        ),
        (success) => context.pushReplacement(
          '${Routes.createNewPassword}?email=${widget.email}&token=${_codeController.text}',
        ),
      );

      setState(() => _isLoading = false);
    }
  }
}
