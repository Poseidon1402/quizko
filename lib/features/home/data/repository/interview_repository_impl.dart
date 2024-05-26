import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/interview_entity.dart';
import '../../domain/repository/interview_repository.dart';
import '../source/interview_source.dart';

class InterviewRepositoryImpl implements InterviewRepository {
  final InterviewSource source;
  final FlutterSecureStorage secureStorage;

  InterviewRepositoryImpl({required this.source, required this.secureStorage,});

  @override
  Future<Either<Failure, List<InterviewEntity>>> fetchInterviews() async {
    try {
      final token = await secureStorage.read(key: 'token');
      final interviews = await source.fetchInterviews(token!);

      return Right(interviews);
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}