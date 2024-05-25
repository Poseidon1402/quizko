import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/others/grdient_progress_bar.dart';
import '../partials/question_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColor.white1,
        ),
        actions: [
          Chip(
            elevation: 0.0,
            backgroundColor: AppColor.blue4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(49)),
            avatar: SvgPicture.asset('assets/icons/timer.svg'),
            label: Text(
              '01:20',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            side: BorderSide.none,
          ),
          const Gap(10),
          Chip(
            elevation: 0.0,
            backgroundColor: AppColor.blue4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(49)),
            avatar: SvgPicture.asset('assets/icons/timer.svg'),
            label: Text(
              '20',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            side: BorderSide.none,
          ),
          const Gap(10),
        ],
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Question ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    TextSpan(
                      text: '02',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    TextSpan(
                      text: '/20',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColor.purple5,
                          ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              const GradientProgressBar(percentage: 8 / 20),
              const Gap(20),
              const Expanded(
                child: QuestionBody(),
              ),
              const Gap(20),
              FractionallySizedBox(
                widthFactor: 1,
                child: CustomElevatedButton(
                  onPressed: () {},
                  borderRadius: 24,
                  backgroundColor: AppColor.white1.withOpacity(0.1),
                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
