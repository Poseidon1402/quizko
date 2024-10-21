import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/services/injections.dart';
import '../../../../core/validator/form_validators.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/input/select_field.dart';
import '../../../../shared/components/others/app_snackbar.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../auth/presentation/bloc/authentication_bloc.dart';
import '../../domain/entity/class_entity.dart';
import '../../domain/usecases/update_user.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _registrationNumberController;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late String _gender;

  initForm() {
    final currentUser =
        (context.read<AuthenticationBloc>().state as AuthenticatedState)
            .currentUser;
    _registrationNumberController =
        TextEditingController(text: currentUser.registrationNumber);
    _nameController = TextEditingController(text: currentUser.fullName);
    _emailController = TextEditingController(text: currentUser.email);
    _phoneController = TextEditingController(text: currentUser.phone);
    _gender = currentUser.gender;
  }

  @override
  void initState() {
    initForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'My profile',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor:
                          Theme.of(context).colorScheme.primary,
                          radius: 45,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: _gender == 'masculine' ? const AssetImage('assets/images/male.jpg') : const AssetImage('assets/images/female.jpg'),
                          ),
                        ),
                      ),
                      const Gap(20),
                      CustomTextFormField(
                        controller: _registrationNumberController,
                        readOnly: true,
                        showCursor: false,
                        label: 'Registration Number',
                      ),
                      const Gap(20),
                      CustomTextFormField(
                        controller: _nameController,
                        validator: isRequired,
                        keyboardType: TextInputType.name,
                        label: 'Full Name',
                      ),
                      const Gap(20),
                      CustomTextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: isEmail,
                        label: 'Email',
                      ),
                      const Gap(20),
                      SelectField(
                        value: _gender,
                        contentPadding: const EdgeInsets.all(10),
                        onChanged: (value) => setState(() => _gender = value),
                        hintText: 'Gender',
                        icon: Icons.keyboard_arrow_down,
                        items: const [
                          DropdownMenuItem(
                            value: 'masculine',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'feminine',
                            child: Text('Female'),
                          ),
                        ],
                      ),
                      const Gap(20),
                      CustomTextFormField(
                        controller: _phoneController,
                        hintText: 'ex: 0320012345',
                        validator: (value) => isPhoneNumber(value),
                        keyboardType: TextInputType.phone,
                        label: 'Phone',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        FractionallySizedBox(
          widthFactor: 0.9,
          child: CustomElevatedButton(
            // onPressed: _onSaveButtonTapped,
            backgroundColor: Theme.of(context).colorScheme.primary,
            borderRadius: 24,
            child: _isLoading
                ? const SpinKitWave(
              color: AppColor.white1,
              size: 20,
            ) : Text(
              'Save',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  /*void _onSaveButtonTapped() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final result = await sl<UpdateUser>().call(
        user: UserModel(
          registrationNumber: _registrationNumberController.text,
          fullName: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          classEntity: const ClassEntity(
            id: 1,
            name: 'M1 GID',
          ),
          gender: _gender,
        ),
      );

      result.fold(
          (failure) => ScaffoldMessenger.of(context).showSnackBar(
                myAppSnackBar(
                  context: context,
                  message: failure.message,
                  backgroundColor: AppColor.red1,
                ),
              ), (user) {
        context.read<AuthenticationBloc>().add(UpdateUserEvent(user: user));
        Fluttertoast.showToast(
          msg: 'Updated successfully',
          textColor: AppColor.white1,
        );
      });

      setState(() => _isLoading = false);
    }
  }*/
}
