import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/interview_entity.dart';
import '../repository/interview_repository.dart';

abstract class FetchInterviews {
  Future<Either<Failure, List<InterviewEntity>>> call();
}

class FetchInterviewsImpl implements FetchInterviews {
  final InterviewRepository repository;

  FetchInterviewsImpl({required this.repository});

  @override
  Future<Either<Failure, List<InterviewEntity>>> call() {
    return repository.fetchInterviews();
  }
}