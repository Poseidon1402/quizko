import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../shared/components/body/zero_items_body.dart';
import '../../../auth/presentation/bloc/authentication_bloc.dart';
import '../../../home/presentation/bloc/interview_bloc.dart' as interview;
import '../components/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser =
        (context.watch<AuthenticationBloc>().state as AuthenticatedState)
            .currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: currentUser.gender == 'masculine'
                ? const AssetImage('assets/images/male.jpg')
                : const AssetImage('assets/images/female.jpg'),
            backgroundColor: Colors.red,
            radius: 15.0,
          ),
        ),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Hi, ${currentUser.fullName}\n',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(
                text: currentUser.registrationNumber,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        actions: [
          Image.asset('assets/logo/eni.png'),
          const Gap(10),
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<interview.InterviewBloc, interview.InterviewState>(
          builder: (context, state) {
            if (state is interview.LoadingState ||
                state is interview.InitialState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is interview.InterviewsLoaded) {
              final interviews = state.interviews
                  .where((interview) => interview.isCompleted)
                  .toList();

              if (interviews.isEmpty) {
                return const ZeroItemsBody();
              } else {
                return ListView.separated(
                  itemBuilder: (_, index) => Quiz(
                    interview: interviews[index],
                  ),
                  itemCount: interviews.length,
                  separatorBuilder: (_, index) => const Gap(15),
                );
              }
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
