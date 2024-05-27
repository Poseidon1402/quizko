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
import '../../../../shared/components/others/app_snackbar.dart';
import '../../../../shared/components/others/grdient_progress_bar.dart';
import '../../../auth/presentation/bloc/authentication_bloc.dart';
import '../../../home/domain/entity/interview_entity.dart';
import '../bloc/answer_cubit.dart';
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
  int currentIndex = 0;
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuizBloc>(
          create: (context) => QuizBloc(
            fetchMark: sl(),
          ),
        ),
        BlocProvider(create: (context) => AnswerCubit()),
      ],
      child: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is QuizStateFinished) {
            context.pushReplacement(Routes.mark, extra: state.mark);
          } else if (state is QuizStateLoaded) {
            setState(() => currentIndex = state.currentQuestionIndex);
          } else if (state is QuizStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              myAppSnackBar(
                context: context,
                message: state.failure.message,
                backgroundColor: AppColor.red1,
              ),
            );
          }
        },
        builder: (context, state) {
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
                            text: (currentIndex + 1).toString().padLeft(2, '0'),
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
                      percentage: (currentIndex + 1) /
                          widget.interview.subject.questions.length,
                    ),
                    const Gap(20),
                    Expanded(
                      child: QuestionBody(
                        interview: widget.interview,
                        currentIndex: currentIndex,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _decrementTimer(timer) {
    if (currentDuration.inMinutes == 0) {
      timer.cancel();
      context.read<QuizBloc>().add(
            QuizEventFinished(
              answers: context.read<AnswerCubit>().state,
              interviewId: widget.interview.id,
              candidateId: (context.read<AuthenticationBloc>().state
                      as AuthenticatedState)
                  .currentUser
                  .candidateId,
            ),
          );
    } else {
      setState(() {
        currentDuration -= const Duration(minutes: 1);
      });
    }
  }
}
