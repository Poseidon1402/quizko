import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/input/select_field.dart';
import '../../../../shared/components/others/app_snackbar.dart';
import '../../data/models/user_model.dart';
import '../bloc/authentication_bloc.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({super.key});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final _formKey = GlobalKey<FormState>();
  final _registrationNumberController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          context.go(Routes.home);
        } else if (state is UnauthenticatedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            myAppSnackBar(
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
              controller: _registrationNumberController,
              hintText: 'Registration number',
              validator: isFourDigitNumber,
              keyboardType: const TextInputType.numberWithOptions(),
              textInputAction: TextInputAction.done,
              borderRadius: 24.0,
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _fullNameController,
              hintText: 'Full name',
              keyboardType: TextInputType.emailAddress,
              validator: isRequired,
              textInputAction: TextInputAction.done,
              borderRadius: 24.0,
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: isEmail,
              textInputAction: TextInputAction.done,
              borderRadius: 24.0,
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _passwordController,
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              validator: isRequired,
              obscureText: _isObscure,
              textInputAction: TextInputAction.done,
              borderRadius: 24.0,
            ),
            const Gap(40),
            FractionallySizedBox(
              widthFactor: 1,
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                return CustomElevatedButton(
                  onPressed:
                      state is! LoadingState ? _onSubscribeButtonTapped : () {},
                  borderRadius: 24.0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: state is LoadingState
                      ? SpinKitWave(
                          size: 20.sp,
                          color: AppColor.white1,
                        )
                      : Text(
                          'Subscribe',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubscribeButtonTapped() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthenticationBloc>().add(
            SubscribeUserEvent(
              newUser: UserModel(
                registrationNumber: _registrationNumberController.text,
                fullName: _fullNameController.text,
                email: _emailController.text,
                password: _passwordController.text,
                gender: 'masculine',
              ),
            ),
          );
    }
  }
}
