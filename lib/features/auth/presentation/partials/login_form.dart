import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/utils/constants/widget_keys.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/others/app_snackbar.dart';
import '../bloc/authentication_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          context.go(Routes.home);
        } else if (state is UnauthenticatedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            myAppSnackBar(
              key: WidgetKeys.signInErrorSnackBar,
              context: context,
              message: state.message,
              backgroundColor: AppColor.red1,
            ),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              key: WidgetKeys.signInEmailKey,
              controller: _emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: isEmail,
              textInputAction: TextInputAction.done,
              borderRadius: 24.0,
            ),
            const Gap(20),
            CustomTextFormField(
              key: WidgetKeys.signInPasswordKey,
              controller: _passwordController,
              hintText: 'Password',
              obscureText: !_showPassword,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: InkWell(
                onTap: () => setState(() => _showPassword = !_showPassword),
                child: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.grey1,
                ),
              ),
              validator: (value) => length(value, min: 6, max: 50),
              textInputAction: TextInputAction.done,
              borderRadius: 24.0,
            ),
            const Gap(10),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => context.push(Routes.forgotPassword),
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
            FractionallySizedBox(
              widthFactor: 1,
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    key: WidgetKeys.signInButtonKey,
                    onPressed: _onSignInButtonTapped,
                    borderRadius: 24.0,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: state is LoadingState
                    ? SpinKitWave(
                    size: 20.sp,
                    color: AppColor.white1,
                  ) : Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonTapped() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthenticationBloc>().add(
            SignInEvent(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }
}
