import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/error/failures.dart';
import 'package:quizko/features/account/data/models/class_model.dart';
import 'package:quizko/features/account/presentation/bloc/class/class_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockFetchClasses mockFetchClasses;
  late ClassBloc classBloc;

  setUp(() {
    mockFetchClasses = MockFetchClasses();
    classBloc = ClassBloc(fetchClasses: mockFetchClasses);
  });

  test(
    'the initial value should be initial state',
    () => expect(classBloc.state, equals(InitialState())),
  );

  group('Fecth classes', () {
    const classes = [
      ClassModel(
        id: 'bf94a726-5934-4339-9efe-f41f0ebb1da8',
        group: 'G1',
        level: 'L1',
        category: 'GB',
      ),
      ClassModel(
        id: '2bcc9fb4-b1b0-4cef-b872-2d92cfdfb0f7',
        group: 'G2',
        level: 'L1',
        category: 'GB',
      ),
    ];

    blocTest(
      'Should emit [LoadingClassState, LoadedClassState] when fetching classes',
      build: () {
        when(mockFetchClasses.call()).thenAnswer(
          (_) async => const Right(classes),
        );
        return classBloc;
      },
      act: (bloc) => bloc.add(FetchClassesEvent()),
      expect: () => [
        LoadingClassState(),
        LoadedClassState(classes: classes),
      ],
    );

    blocTest(
      'Should emit [LoadingClassState, ErrorClassState] when fetching classes',
      build: () {
        when(mockFetchClasses.call()).thenAnswer(
          (_) async => const Left(ServerFailure()),
        );
        return classBloc;
      },
      act: (bloc) => bloc.add(FetchClassesEvent()),
      expect: () => [
        LoadingClassState(),
        ErrorClassState(error: const ServerFailure()),
      ],
    );
  });
}
