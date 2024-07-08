import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/input/select_field.dart';
import '../../../../shared/components/others/app_snackbar.dart';
import '../../../account/domain/entity/class_entity.dart';
import '../../../account/presentation/bloc/class/class_bloc.dart';
import '../../data/models/user_model.dart';
import '../bloc/authentication_bloc.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({super.key});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final List<String?> _registrationId = ['HF', 'H-Tol', null];
  String? _regId;
  final _formKey = GlobalKey<FormState>();
  final _registrationNumberController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _classController = TextEditingController();
  int _classId = -1;
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
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: _registrationNumberController,
                    hintText: 'Registration number',
                    keyboardType: const TextInputType.numberWithOptions(),
                    textInputAction: TextInputAction.done,
                    borderRadius: 24.0,
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: SelectField(
                    value: _regId,
                    contentPadding: const EdgeInsets.all(15),
                    borderRadius: 24.0,
                    onChanged: (value) => _regId = value,
                    dropdownColor: AppColor.white2,
                    items: _registrationId
                        .map(
                          (id) => DropdownMenuItem(
                            value: id,
                            child: Text(
                              id ?? 'None',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
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
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => length(value, min: 6, max: 50),
              textInputAction: TextInputAction.done,
              borderRadius: 24.0,
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _phoneController,
              hintText: 'ex: 0320012345',
              validator: (value) => isPhoneNumber(value),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              label: 'Phone',
            ),
            const Gap(20),
            CustomTextFormField(
              controller: _classController,
              hintText: 'Classes',
              validator: isRequired,
              readOnly: true,
              showCursor: false,
              onTap: _showClassesDialog,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
            ),
            const Gap(40),
            FractionallySizedBox(
              widthFactor: 1,
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    onPressed: state is! LoadingState
                        ? _onSubscribeButtonTapped
                        : () {},
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
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                  );
                },
              ),
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
                registrationNumber:
                    '${_registrationNumberController.text}${_regId != null ? '_$_regId' : ''}',
                fullName: _fullNameController.text,
                email: _emailController.text,
                password: _passwordController.text,
                phone: _phoneController.text,
                classEntity: ClassEntity(
                  id: _classId,
                  name: _classController.text,
                ),
                gender: 'masculine',
              ),
            ),
          );
    }
  }

  void _showClassesDialog() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.8,
          child: BlocBuilder<ClassBloc, ClassState>(
            builder: (_, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadedClassState) {
                return ListView(
                  children: state.classes
                      .map(
                        (item) => ListTile(
                          onTap: () {
                            setState(() => _classController.text = item.name);
                            _classId = item.id;
                            context.pop();
                          },
                          trailing: Checkbox(
                            value: item.id == _classId,
                            onChanged: (value) {
                              setState(() => _classController.text = item.name);
                              _classId = item.id;
                              context.pop();
                            },
                          ),
                          title: Text(
                            item.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      )
                      .toList(),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
