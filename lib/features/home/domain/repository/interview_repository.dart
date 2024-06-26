import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../result/domain/entity/result_question_entity.dart';
import '../entity/interview_entity.dart';

abstract class InterviewRepository {
  Future<Either<Failure, List<InterviewEntity>>> fetchInterviews(
      {required int candidateId});
  Future<Either<Failure, int>> getMarks({
    required int interviewId,
    required int candidateId,
    required List<Map<String, int>> answers,
  });
  Future<Either<Failure, List<ResultQuestionEntity>>> fetchCorrections({
    required int candidateId,
    required int interviewId,
  });
}
