import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../home/domain/entity/interview_entity.dart';
import '../components/answer.dart';

class QuestionBody extends StatefulWidget {
  final InterviewEntity interview;

  const QuestionBody({
    super.key,
    required this.interview,
  });

  @override
  State<QuestionBody> createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  int _currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Question ',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              TextSpan(
                text: (_currentQuestion + 1).toString().padLeft(2, '0'),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              TextSpan(
                text: '/${widget.interview.corrections.length}',
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
            for (int i = 0; i < widget.interview.corrections.length; i++)
              Flexible(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  padding: EdgeInsets.all(i <= _currentQuestion ? 2 : 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    border: i <= _currentQuestion
                        ? Border.all(
                            width: 0.8, color: Colors.white.withOpacity(0.38))
                        : const Border.fromBorderSide(BorderSide.none),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Visibility(
                    visible: i <= _currentQuestion,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: AppColor.green1,
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const Gap(20),
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
                                text: '${widget.interview.name}\n\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: AppColor.grey3,
                                    ),
                              ),
                              TextSpan(
                                text: widget.interview
                                    .corrections[_currentQuestion].label,
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
                        for (int i = 0;
                            i <
                                widget.interview.corrections[_currentQuestion]
                                    .answers.length;
                            i++)
                          Answer(
                            answer: widget.interview
                                .corrections[_currentQuestion].answers[i],
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Gap(20),
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                onPressed: _currentQuestion != 0
                    ? () => setState(() => _currentQuestion -= 1)
                    : null,
                borderRadius: 24,
                backgroundColor: AppColor.white1.withOpacity(0.1),
                child: Text(
                  'Back',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
            const Gap(12),
            Expanded(
              child: CustomElevatedButton(
                onPressed:
                    _currentQuestion != widget.interview.corrections.length - 1
                        ? () => setState(() => _currentQuestion += 1)
                        : null,
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
          ],
        ),
        const Gap(20)
      ],
    );
  }
}
