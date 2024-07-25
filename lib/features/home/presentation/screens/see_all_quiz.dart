import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/body/zero_items_body.dart';
import '../components/quiz.dart';
import '../bloc/interview_bloc.dart';

class SeeAllQuiz extends StatelessWidget {
  const SeeAllQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    final interviews = (context.read<InterviewBloc>().state as InterviewsLoaded).interviews;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.grey1,
          ),
        ),
        title: Text(
          'All Quiz',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        centerTitle: true,
      ),
      body: interviews.isEmpty ? const ZeroItemsBody() : ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: interviews.length,
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (context, index) => Quiz(interview: interviews[index],),
      ),
    );
  }
}