import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../result/data/source/result_source.dart';
import '../../../result/domain/entity/result_question_entity.dart';
import '../../domain/entity/interview_entity.dart';
import '../../domain/repository/interview_repository.dart';
import '../source/interview_source.dart';

class InterviewRepositoryImpl implements InterviewRepository {
  final InterviewSource interviewSource;
  final ResultSource resultSource;
  final FlutterSecureStorage secureStorage;

  InterviewRepositoryImpl({
    required this.interviewSource,
    required this.resultSource,
    required this.secureStorage,
  });

  @override
  Future<Either<Failure, List<InterviewEntity>>> fetchInterviews(
      {required int candidateId, required int classId}) async {
    try {
      final token = await secureStorage.read(key: 'token');
      final data = await interviewSource.fetchInterviews(token!, classId);
      List<InterviewEntity> interviews = [];

      for (InterviewEntity interview in data) {
        final questions = await interviewSource.fetchRelatedQuestions(
            token: token, subjectId: interview.subject.id);
        final isCompleted = await interviewSource.isAlreadyCompleted(
            token: token, interviewId: interview.id, candidateId: candidateId);
        interviews.add(
          interview.copyWith(
            subject: interview.subject.copyWith(questions: questions),
            isCompleted: isCompleted,
          ),
        );
      }

      return Right(interviews);
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getMarks({
    required int interviewId,
    required int candidateId,
    required List<Map<String, int>> answers,
  }) async {
    try {
      final token = await secureStorage.read(key: 'token');
      final data = await interviewSource.submitQuiz(
        token: token!,
        interviewId: interviewId,
        candidateId: candidateId,
        answers: answers,
      );

      return Right(data);
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ResultQuestionEntity>>> fetchCorrections({
    required int candidateId,
    required int interviewId,
  }) async {
    try {
      final token = await secureStorage.read(key: 'token');
      final data = await resultSource.fetchCorrections(
        candidateId: candidateId,
        interviewId: interviewId,
        token: token!,
      );

      return Right(data);
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
