import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../bloc/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showIpInputDialog());
    super.initState();
  }

  Future<void> _showIpInputDialog() async {
    final formKey = GlobalKey<FormState>();
    final TextEditingController ipAddressController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(
            'Enter IP Address',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Form(
            key: formKey,
            child: Wrap(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      Icon(
                        Icons.wifi,
                        color: Theme.of(context).colorScheme.primary,
                        size: 50.sp,
                      ),
                      const Gap(10),
                      CustomTextFormField(
                        controller: ipAddressController,
                        validator: isValidIpAddressAndPort,
                        keyboardType: TextInputType.text,
                        errorFontSize: 12,
                        hintText: 'ex: 192.168.1.100:5555',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FractionallySizedBox(
              widthFactor: 1,
              child: CustomElevatedButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  'OK',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                onPressed: () {
                  if(formKey.currentState!.validate()) {
                    ApiConfig.baseUrl = ipAddressController.text;
                    context.read<AuthenticationBloc>().add(VerifyTokenEvent());
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          context.go(Routes.home);
        } else if (state is UnauthenticatedState) {
          context.go(Routes.login);
        }
      },
      child: Container(
        color: AppColor.purple3,
        child: Center(
          child: FractionallySizedBox(
            heightFactor: 0.6,
            child: Image.asset('assets/logo/logo_splash.png'),
          ),
        ),
      ),
    );
  }
}
