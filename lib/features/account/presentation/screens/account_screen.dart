import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/input/select_field.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
                    const CustomTextFormField(
                      label: 'First Name',
                    ),
                    const Gap(20),
                    const CustomTextFormField(
                      label: 'Last Name',
                    ),
                    const Gap(20),
                    const CustomTextFormField(
                      label: 'Number',
                    ),
                    const Gap(20),
                    const CustomTextFormField(
                      label: 'Email',
                    ),
                    const Gap(20),
                    const CustomTextFormField(
                      label: 'Phone Number',
                    ),
                    const Gap(20),
                    SelectField(
                      onChanged: (value) {},
                      hintText: 'Gender',
                      icon: Icons.keyboard_arrow_down,
                      items: const [
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
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
