import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/class_entity.dart';

abstract class ClassRepository {
  Future<Either<Failure, List<ClassEntity>>> fetchAll();
}