import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: const Column(
          children: [
            CustomTextFormField(
              hintText: 'Password',
              borderRadius: 24,
              backgroundColor: AppColor.white2,
            ),
            Gap(20),
            CustomTextFormField(
              hintText: 'New Password',
              borderRadius: 24,
              backgroundColor: AppColor.white2,
            ),
            Gap(20),
            CustomTextFormField(
              hintText: 'Confirm New Password',
              borderRadius: 24,
              backgroundColor: AppColor.white2,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.95,
            child: CustomElevatedButton(
              onPressed: () {},
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderRadius: 24,
              child: Text(
                'Save',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
