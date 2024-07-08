import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/class_entity.dart';
import '../../domain/repository/class_repository.dart';
import '../source/class_source.dart';

class ClassRepositoryImpl implements ClassRepository {
  final ClassSource source;
  
  ClassRepositoryImpl({required this.source});
  
  @override
  Future<Either<Failure, List<ClassEntity>>> fetchAll() async {
    try {
      final classes =  await source.fetchAll();
      return Right(classes);
    } on InternetConnectionException {
      return const Left(NotConnectedFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}