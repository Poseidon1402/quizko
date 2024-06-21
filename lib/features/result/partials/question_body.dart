import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/colors/app_color.dart';
import '../components/answer.dart';

class QuestionBody extends StatelessWidget {
  const QuestionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: FractionallySizedBox(
              heightFactor: 0.97,
              child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: FractionallySizedBox(
                  heightFactor: 0.97,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    constraints: const BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Interview name\n\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: AppColor.grey3,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    'What is the purpose of a firewall in network security?',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Answer(),
                        Answer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Gap(20),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/drag.svg'),
              const Gap(15),
              Text(
                'Drag',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
