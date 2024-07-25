import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/class_entity.dart';
import '../repository/class_repository.dart';

abstract class FetchClasses {
  Future<Either<Failure, List<ClassEntity>>> call();
}

class FetchClassesImpl implements FetchClasses {
  final ClassRepository repository;

  FetchClassesImpl({required this.repository});

  @override
  Future<Either<Failure, List<ClassEntity>>> call() {
    return repository.fetchAll();
  }
}