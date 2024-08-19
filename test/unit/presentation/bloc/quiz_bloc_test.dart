import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/error/failures.dart';
import 'package:quizko/features/quiz/presentation/bloc/quiz_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockFetchMarks mockFetchMarks;
  late QuizBloc quizBloc;

  setUp(() {
    mockFetchMarks = MockFetchMarks();
    quizBloc = QuizBloc(fetchMark: mockFetchMarks);
  });

  test(
    'initial state should be QuizStateLoaded with current question index = 0',
        () => expect(quizBloc.state, QuizStateLoaded(currentQuestionIndex: 0)),
  );

  group('Handle next question event', () {
    blocTest(
      'Should emit [QuizStateLoaded] with current question index increased',
      build: () => quizBloc,
      act: (bloc) => bloc.add(QuizEventNextQuestion()),
      expect: () => [QuizStateLoaded(currentQuestionIndex: 1)],
    );
  });

  group('Handle previous question event', () {
    blocTest<QuizBloc, QuizState>(
      'Should emit [QuizStateLoaded] with current question index decreased',
      seed: () => QuizStateLoaded(currentQuestionIndex: 1),
      build: () => quizBloc,
      act: (bloc) => bloc.add(QuizEventPreviousQuestion()),
      expect: () => [QuizStateLoaded(currentQuestionIndex: 0)],
    );

    blocTest(
      'Should emit [QuizStateLoaded] with current question index remain the same',
      build: () => quizBloc,
      act: (bloc) => bloc.add(QuizEventPreviousQuestion()),
      expect: () => [],
    );
  });

  group('Handle finish event', () {
    blocTest(
      'Should emit [QuizStateLoading, QuizStateFinished, QuizStateLoaded] when QuizEventFinished is fired',
      build: () {
        when(mockFetchMarks(
          answers: [
            {'answer_id': 1}
          ],
          candidateId: 1,
          interviewId: 1,
        )).thenAnswer((_) async => const Right(10));
        return quizBloc;
      },
      act: (bloc) => bloc.add(QuizEventFinished(
        answers: const {
          1: {'answer_id': 1}
        },
        interviewId: 1,
        candidateId: 1,
      )),
      expect: () => [
        QuizStateLoading(),
        QuizStateFinished(mark: 10),
        QuizStateLoaded(currentQuestionIndex: 0),
      ],
    );

    blocTest<QuizBloc, QuizState>(
      'Should emit [QuizStateLoading, QuizStateError, QuizStateLoaded] when QuizEventFinished is fired',
      build: () {
        when(mockFetchMarks(
          answers: [
            {'answer_id': 1}
          ],
          candidateId: 1,
          interviewId: 1,
        )).thenAnswer((_) async => const Left(ServerFailure()));
        return quizBloc;
      },
      seed: () => QuizStateLoaded(currentQuestionIndex: 19),
      act: (bloc) => bloc.add(QuizEventFinished(
        answers: const {
          1: {'answer_id': 1}
        },
        interviewId: 1,
        candidateId: 1,
      )),
      expect: () => [
        QuizStateLoading(),
        QuizStateError(failure: const ServerFailure()),
        QuizStateLoaded(currentQuestionIndex: 19),
      ],
    );
  });
}