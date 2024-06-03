import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/input/select_field.dart';
import '../../../auth/presentation/bloc/authentication_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late final TextEditingController _registrationNumberController;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late String _gender;

  initForm() {
    final currentUser = (context.read<AuthenticationBloc>().state as AuthenticatedState).currentUser;
    _registrationNumberController = TextEditingController(text: currentUser.registrationNumber);
    _nameController = TextEditingController(text: currentUser.fullName);
    _emailController = TextEditingController(text: currentUser.email);
    print(currentUser.gender);
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
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ListView(
                  children: [
                    Center(
                      child: badges.Badge(
                        badgeContent: const Icon(
                          Icons.edit,
                          color: AppColor.white1,
                        ),
                        position:
                            badges.BadgePosition.bottomEnd(bottom: 0, end: -5),
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          radius: 45,
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                          ),
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
                      keyboardType: TextInputType.name,
                      readOnly: true,
                      showCursor: false,
                      label: 'Full Name',
                    ),
                    const Gap(20),
                    CustomTextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      readOnly: true,
                      showCursor: false,
                      label: 'Email',
                    ),
                    const Gap(20),
                    SelectField(
                      value: _gender,
                      contentPadding: const EdgeInsets.all(10),
                      onChanged: (value) {},
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        FractionallySizedBox(
          widthFactor: 0.9,
          child: CustomElevatedButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).colorScheme.primary,
            borderRadius: 24,
            child: Text(
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
}
