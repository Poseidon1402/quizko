import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/services/injections.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/others/app_snackbar.dart';
import '../../../auth/domain/usecases/update_password.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Security & Password',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        constraints: const BoxConstraints.expand(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _currentPasswordController,
                hintText: 'Current Password',
                obscureText: true,
                validator: (value) => length(value, min: 6),
                borderRadius: 24,
                backgroundColor: AppColor.white2,
              ),
              const Gap(20),
              CustomTextFormField(
                controller: _passwordController,
                hintText: 'New Password',
                obscureText: true,
                validator: (value) => length(value, min: 6),
                borderRadius: 24,
                backgroundColor: AppColor.white2,
              ),
              const Gap(20),
              CustomTextFormField(
                controller: _passwordConfirmationController,
                hintText: 'Confirm New Password',
                obscureText: true,
                validator: (value) => isTheSamePassword(
                  value,
                  _passwordConfirmationController.text,
                ),
                borderRadius: 24,
                backgroundColor: AppColor.white2,
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.95,
            child: CustomElevatedButton(
              onPressed: _onButtonTapped,
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderRadius: 24,
              child: _isLoading
                  ? const SpinKitWave(
                      color: AppColor.white1,
                      size: 20,
                    )
                  : Text(
                      'Save',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void _onButtonTapped() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final result = await sl<UpdatePassword>().call(
        currentPassword: _currentPasswordController.text,
        password: _passwordController.text,
      );

      result.fold(
        (failure) => ScaffoldMessenger.of(context).showSnackBar(
          myAppSnackBar(
            context: context,
            message: failure.message,
            backgroundColor: AppColor.red1,
          ),
        ),
        (success) => context.pop(),
      );

      setState(() => _isLoading = false);
    }
  }
}
