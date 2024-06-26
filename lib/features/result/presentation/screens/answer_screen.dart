import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../home/presentation/bloc/interview_bloc.dart';
import '../partials/question_body.dart';

class AnswerScreen extends StatelessWidget {
  final String interviewId;

  const AnswerScreen({super.key, required this.interviewId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterviewBloc, InterviewState>(
        builder: (context, state) {
      if (state is InterviewsLoaded) {
        final interview = state.interviews
            .where((interview) => interview.id == int.parse(interviewId))
            .first;
        if (interview.corrections.isNotEmpty) {
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  backgroundColor: AppColor.green1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(49)),
                  avatar: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  label: Text(
                      '${interview.corrections.where((correction) => correction.answers.where((answer) => answer.isCorrect).first.label == correction.answers.where((answer) => answer.isCandidateAnswer).first.label).length}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  side: BorderSide.none,
                ),
                const Gap(10),
                Chip(
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  backgroundColor: AppColor.red3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(49),
                  ),
                  avatar: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  label: Text(
                    '${interview.corrections.where((correction) => correction.answers.where((answer) => answer.isCorrect).first.label != correction.answers.where((answer) => answer.isCandidateAnswer).first.label).length}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
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
                child: QuestionBody(interview: interview),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
