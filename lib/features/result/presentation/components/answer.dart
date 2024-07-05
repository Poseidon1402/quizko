import 'package:flutter/material.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../domain/entity/result_answer_entity.dart';

class Answer extends StatelessWidget {
  final ResultAnswerEntity answer;

  const Answer({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: answer.isCorrect || answer.isCandidateAnswer ? Colors.transparent : AppColor.grey4,
        border: answer.isCandidateAnswer || answer.isCorrect
            ? Border.all(
                width: 1.5,
                color: answer.isCorrect ? AppColor.green1 : AppColor.red1,
              )
            : const Border.fromBorderSide(BorderSide.none),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              answer.label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Visibility(
            visible: answer.isCorrect || answer.isCandidateAnswer,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: answer.isCorrect ? AppColor.green1.withOpacity(0.53) : AppColor.red1.withOpacity(0.53),
                ),
                color: answer.isCorrect ? AppColor.green1 : AppColor.red1,
              ),
              child: Icon(
                answer.isCorrect ? Icons.check : Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
