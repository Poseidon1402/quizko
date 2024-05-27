import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/interview_entity.dart';

abstract class InterviewRepository {
  Future<Either<Failure, List<InterviewEntity>>> fetchInterviews();
  Future<Either<Failure, int>> getMarks({
    required int interviewId,
    required int candidateId,
    required List<Map<String, int>> answers,
  });
}
