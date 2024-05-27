import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/others/app_checkbox.dart';
import '../../../home/domain/entity/interview_entity.dart';
import '../bloc/quiz_bloc.dart';

class QuestionBody extends StatelessWidget {
  final InterviewEntity interview;

  const QuestionBody({
    super.key,
    required this.interview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: BlocBuilder<QuizBloc, QuizState>(
                builder: (context, state) {
                  final currentIndex = (state as QuizStateLoaded).currentQuestionIndex;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${interview.name}\n\n',
                              style:
                                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: AppColor.grey3,
                                      ),
                            ),
                            TextSpan(
                              text: interview.subject.questions[currentIndex].label,
                              style:
                                  Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Colors.black,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      ...interview.subject.questions[currentIndex].answers
                          .map(
                            (answer) => AppCheckbox(
                              label: answer.label,
                              onChanged: (value) {
                                context.read<QuizBloc>().add(
                                      QuizEventAnswered(
                                        questionIndex: currentIndex,
                                        answerIndex: interview.subject.questions[currentIndex].answers.indexOf(answer),
                                      ),
                                    );
                              },
                            ),
                          )
                          .toList(),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
