import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ZeroItemsBody extends StatelessWidget {
  const ZeroItemsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/zero_items.png'),
        const Gap(20),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'No quizzes available at this time.\n',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Check back later for new quizzes',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}