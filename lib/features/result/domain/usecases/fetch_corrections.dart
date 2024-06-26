import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/domain/repository/interview_repository.dart';
import '../entity/result_question_entity.dart';

abstract class FetchCorrections {
  Future<Either<Failure, List<ResultQuestionEntity>>> call({
    required int candidateId,
    required int interviewId,
  });
}

class FetchCorrectionsImpl implements FetchCorrections {
  final InterviewRepository repository;

  FetchCorrectionsImpl({required this.repository});

  @override
  Future<Either<Failure, List<ResultQuestionEntity>>> call({
    required int candidateId,
    required int interviewId,
  }) {
    return repository.fetchCorrections(
      candidateId: candidateId,
      interviewId: interviewId,
    );
  }
}
