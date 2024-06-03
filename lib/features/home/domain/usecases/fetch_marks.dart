import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/interview_repository.dart';

abstract class FetchMarks {
  Future<Either<Failure, int>> call({
    required int interviewId,
    required int candidateId,
    required List<Map<String, int>> answers,
  });
}

class FetchMarksImpl implements FetchMarks {
  final InterviewRepository repository;

  FetchMarksImpl({required this.repository});

  @override
  Future<Either<Failure, int>> call(
      {required int interviewId,
      required int candidateId,
      required List<Map<String, int>> answers}) {
    return repository.getMarks(
      interviewId: interviewId,
      candidateId: candidateId,
      answers: answers,
    );
  }
}
