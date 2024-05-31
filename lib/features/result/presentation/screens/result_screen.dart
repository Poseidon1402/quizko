import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/select_field.dart';
import '../../components/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(
          'Result',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        centerTitle: true,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                CustomElevatedButton(
                  onPressed: () {},
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: SvgPicture.asset('assets/icons/filters.svg'),
                ),
                const Gap(10),
                Flexible(
                  child: SelectField(
                    value: 1,
                    icon: Icons.keyboard_arrow_down,
                    filledColor: Theme.of(context).colorScheme.surface,
                    dropdownColor: Theme.of(context).colorScheme.surface,
                    items: const [
                      DropdownMenuItem(value: 2, child: Text('Recent')),
                      DropdownMenuItem(value: 1, child: Text('Recent')),
                    ],
                    onChanged: (value) {},
                  ),
                ),
                const Gap(10),
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Total Points\n',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        TextSpan(
                          text: '16,5 ',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        TextSpan(
                          text: '/20',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Gap(20),
            /*Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const Quiz(),
                separatorBuilder: (context, index) => const Gap(15),
                itemCount: 5,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
