import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../partials/question_body.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        leading: IconButton.outlined(
          onPressed: () => context.pop(),
          style: IconButton.styleFrom(
              side: BorderSide(color: Colors.white.withOpacity(0.18)),
              padding: const EdgeInsets.all(10)),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          Chip(
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10,),
            backgroundColor: AppColor.green1,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(49)),
            avatar: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 18,),
            ),
            label: Text(
              '2',
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
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10,),
            backgroundColor: AppColor.red3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(49)),
            avatar: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 18,),
            ),
            label: Text(
              '2',
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
                      text: (1 + 1).toString().padLeft(2, '0'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 20; i++)
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                ],
              ),
              const Gap(20),
              const Expanded(
                child: QuestionBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
