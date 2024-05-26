import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/interview_entity.dart';

abstract class InterviewRepository {
  Future<Either<Failure, List<InterviewEntity>>> fetchInterviews();
}