import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../auth/presentation/bloc/authentication_bloc.dart';
import '../../../home/domain/entity/interview_entity.dart';
import '../../../home/presentation/bloc/interview_bloc.dart';

class Quiz extends StatelessWidget {
  final InterviewEntity interview;

  const Quiz({
    super.key,
    required this.interview,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapped(context),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 74.w,
              height: 74.w,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [
                    AppColor.purple3,
                    AppColor.purple4,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SvgPicture.asset('assets/logo/logo_white2.svg'),
            ),
            const Gap(10),
            Expanded(
              flex: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${interview.name}\n',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        TextSpan(
                          text: '${interview.subject.questions.length} Questions | Quiz',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Chip(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        avatar: SvgPicture.asset('assets/icons/clock.svg'),
                        label: Text(
                          '${interview.duration.inHours.toString().padLeft(2, '0')} : ${interview.duration.inMinutes.toString().padLeft(2, '0')}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.black.withOpacity(0.45)),
                        ),
                        side: BorderSide.none,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.purple3,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapped(BuildContext context) {
    final candidateId =
        (context.read<AuthenticationBloc>().state as AuthenticatedState)
            .currentUser
            .candidateId;
    context.read<InterviewBloc>().add(
          FetchInterviewCorrectionEvent(
            candidateId: candidateId,
            interviewId: interview.id,
          ),
        );
    context.push('${Routes.userAnswer}?interview=${interview.id}');
  }
}
