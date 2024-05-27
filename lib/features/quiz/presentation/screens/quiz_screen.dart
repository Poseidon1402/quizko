import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../core/utils/services/date_converter_service.dart';
import '../../../../core/utils/services/injections.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/others/grdient_progress_bar.dart';
import '../../../home/domain/entity/interview_entity.dart';
import '../bloc/quiz_bloc.dart';
import '../partials/question_body.dart';

class QuizScreen extends StatefulWidget {
  final InterviewEntity interview;

  const QuizScreen({
    super.key,
    required this.interview,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Duration currentDuration;
  late Timer timer;

  @override
  void initState() {
    currentDuration = widget.interview.duration;
    timer = Timer.periodic(const Duration(minutes: 1), _decrementTimer);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<QuizBloc>(),
      child: BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
        if (state is QuizStateLoaded) {
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
                  backgroundColor: AppColor.blue4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(49)),
                  avatar: SvgPicture.asset('assets/icons/timer.svg'),
                  label: Text(
                    DateConverterService.formatDuration(currentDuration),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  side: BorderSide.none,
                ),
                const Gap(10),
                Chip(
                  elevation: 0.0,
                  backgroundColor: AppColor.blue4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(49)),
                  avatar: SvgPicture.asset('assets/icons/timer.svg'),
                  label: Text(
                    '20',
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
                child: Column(
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
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                          TextSpan(
                            text: (state.currentQuestionIndex + 1)
                                .toString()
                                .padLeft(2, '0'),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          TextSpan(
                            text: '/20',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColor.purple5,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    GradientProgressBar(
                      percentage: (state.currentQuestionIndex + 1) /
                          widget.interview.subject.questions.length,
                    ),
                    const Gap(20),
                    Expanded(
                      child: QuestionBody(
                        interview: widget.interview,
                      ),
                    ),
                    const Gap(20),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: CustomElevatedButton(
                        onPressed: () => _onNextButtonTapped(context),
                        borderRadius: 24,
                        backgroundColor: AppColor.white1.withOpacity(0.1),
                        child: Text(
                          'Next',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
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
        } else {
          return const SizedBox();
        }
      }),
    );
  }

  void _onNextButtonTapped(BuildContext context) {
    context.read<QuizBloc>().add(QuizEventNextQuestion());
  }

  void _decrementTimer(timer) {
    if (currentDuration.inMinutes == 0) {
      timer.cancel();
      context.pushReplacement(Routes.mark);
    } else {
      setState(() {
        currentDuration -= const Duration(minutes: 1);
      });
    }
  }
}
