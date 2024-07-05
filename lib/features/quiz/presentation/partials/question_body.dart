import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/others/app_checkbox.dart';
import '../../../auth/presentation/bloc/authentication_bloc.dart';
import '../../../home/domain/entity/interview_entity.dart';
import '../../../home/presentation/bloc/interview_bloc.dart';
import '../bloc/answer_cubit.dart';
import '../bloc/quiz_bloc.dart';

class QuestionBody extends StatefulWidget {
  final InterviewEntity interview;
  final int currentIndex;

  const QuestionBody({
    super.key,
    required this.interview,
    required this.currentIndex,
  });

  @override
  State<QuestionBody> createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  int _picked = -1;
  late final _replyController;

  @override
  void initState() {
    _replyController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
                                text: widget.interview.subject
                                    .questions[widget.currentIndex].label,
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
                        const Gap(10),
                        widget.interview.subject.questions[widget.currentIndex].type == 'qcm' ? Column(
                          children: widget.interview.subject
                              .questions[widget.currentIndex].answers
                              .map(
                                (answer) => AppCheckbox(
                              label: answer.label,
                              checked: _picked == answer.id,
                              onChanged: (value) {
                                setState(() {
                                  _picked = answer.id;
                                });
                              },
                            ),
                          )
                              .toList(),
                        ) : CustomTextFormField(
                          hintText: 'Your answer',
                          controller: _replyController,
                          minLines: 12,
                          maxLines: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Gap(20),
        FractionallySizedBox(
          widthFactor: 1,
          child: BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
            return CustomElevatedButton(
              onPressed: () {
                if (_picked != -1) {
                  if (widget.currentIndex ==
                      widget.interview.subject.questions.length - 1) {
                    _onFinishButtonTapped(context);
                  } else {
                    _onNextButtonTapped(context);
                  }
                }
              },
              borderRadius: 24,
              backgroundColor: AppColor.white1.withOpacity(0.1),
              child:
                  BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
                if (state is QuizStateLoading) {
                  return const SpinKitThreeBounce(
                    size: 24,
                    color: AppColor.white1,
                  );
                }
                return Text(
                  widget.currentIndex == widget.interview.subject.questions.length - 1 ? 'Finish' : 'Next',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                );
              }),
            );
          }),
        ),
        const Gap(30),
      ],
    );
  }

  void _onNextButtonTapped(BuildContext context) {
    if(widget.interview.subject.questions[widget.currentIndex].type == 'qcm') {
      context.read<AnswerCubit>().setAnswer({'answer_id': _picked});
      setState(() => _picked = -1);
    } else {
      context.read<AnswerCubit>().setAnswer({'answer_id': _replyController.text});
      setState(() => _replyController = '');
    }
    context.read<QuizBloc>().add(QuizEventNextQuestion());
  }

  void _onFinishButtonTapped(BuildContext context) {
    context.read<AnswerCubit>().setAnswer({'answer_id': _picked});
    context.read<InterviewBloc>().add(InterviewCompletedEvent(id: widget.interview.id));
    context.read<QuizBloc>().add(
          QuizEventFinished(
            answers: context.read<AnswerCubit>().state,
            interviewId: widget.interview.id,
            candidateId:
                (context.read<AuthenticationBloc>().state as AuthenticatedState)
                    .currentUser
                    .candidateId,
          ),
        );
  }
}
