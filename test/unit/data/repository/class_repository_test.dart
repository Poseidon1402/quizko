import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/error/exceptions.dart';
import 'package:quizko/core/error/failures.dart';
import 'package:quizko/features/account/data/models/class_model.dart';
import 'package:quizko/features/account/data/repository/class_repository_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockClassSource mockClassSource;
  late ClassRepositoryImpl classRepositoryImpl;

  setUp(() {
    mockClassSource = MockClassSource();
    classRepositoryImpl = ClassRepositoryImpl(source: mockClassSource);
  });

  group('Fetch classes', () {
    const classes = [
      ClassModel(id: 1, name: 'M1 GB'),
      ClassModel(id: 2, name: 'M1 IG'),
    ];

    test('Should return a list of class entity', () async {
      when(mockClassSource.fetchAll()).thenAnswer((_) async => classes);

      final result = await classRepositoryImpl.fetchAll();

      expect(result, equals(const Right(classes)));
    });

    test('Should return a server failure', () async {
      when(mockClassSource.fetchAll()).thenThrow(ServerException());

      final result = await classRepositoryImpl.fetchAll();

      expect(result, equals(const Left(ServerFailure())));
    });
  });
}
