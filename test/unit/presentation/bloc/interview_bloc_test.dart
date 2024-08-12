import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/error/failures.dart';
import 'package:quizko/core/utils/services/date_converter_service.dart';
import 'package:quizko/features/home/data/models/answer_model.dart';
import 'package:quizko/features/home/data/models/question_model.dart';
import 'package:quizko/features/home/domain/entity/interview_entity.dart';
import 'package:quizko/features/home/domain/entity/subject_entity.dart';
import 'package:quizko/features/home/presentation/bloc/interview_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockFetchInterviews mockFetchInterviews;
  late MockFetchCorrections mockFetchCorrections;
  late InterviewBloc interviewBloc;

  setUp(() {
    mockFetchInterviews = MockFetchInterviews();
    mockFetchCorrections = MockFetchCorrections();
    interviewBloc = InterviewBloc(
      fetchInterviews: mockFetchInterviews,
      fetchCorrections: mockFetchCorrections,
    );
  });

  test(
    'The initial value should be initial state',
    () => expect(interviewBloc.state, InitialState()),
  );

  const questions = [
    QuestionModel(
      id: 1,
      label: 'Choose one fact about Android',
      point: 1,
      answers: [
        AnswerModel(id: 1, label: "Android is a web navigator"),
        AnswerModel(id: 2, label: "Android is an app web"),
        AnswerModel(id: 3, label: "Android is a web server"),
        AnswerModel(id: 4, label: "Android is an operating system"),
      ],
      type: "qcm",
    ),
  ];

  final interviews = [
    InterviewEntity(
      id: 1,
      name: 'Test Android 1',
      duration: DateConverterService.convertToDuration("00:30:00"),
      subject: const SubjectEntity(
        id: 1,
        name: 'QCM Android 1',
        questions: questions,
      ),
      isCompleted: false,
    ),
  ];

  group('Fetch interviews', () {
    blocTest(
      'Should emit [LoadingState, InterviewsLoaded] when the FetchInterviewsEvent is fired',
      build: () {
        when(mockFetchInterviews.call(candidateId: 1, classId: 1)).thenAnswer(
          (_) async => Right(interviews),
        );
        return interviewBloc;
      },
      act: (bloc) => bloc.add(FetchInterviewsEvent(candidateId: 1, classId: 1)),
      expect: () => [
        LoadingState(),
        InterviewsLoaded(interviews: interviews),
      ],
    );

    blocTest(
      'Should emit [LoadingState, ErrorState] when the FetchInterviewsEvent is fired',
      build: () {
        when(mockFetchInterviews.call(candidateId: 1, classId: 1)).thenAnswer(
          (_) async => const Left(ServerFailure()),
        );
        return interviewBloc;
      },
      act: (bloc) => bloc.add(FetchInterviewsEvent(
        candidateId: 1,
        classId: 1,
      )),
      expect: () => [
        LoadingState(),
        ErrorState(error: const ServerFailure()),
      ],
    );
  });

  group('Interview completed', () {
    blocTest(
      'Should emit [InterviewsLoaded] with the completed attribute modified to true',
      build: () {
        when(mockFetchInterviews.call(candidateId: 1, classId: 1)).thenAnswer(
          (_) async => Right(interviews),
        );
        return interviewBloc;
      },
      act: (bloc) {
        bloc.add(FetchInterviewsEvent(candidateId: 1, classId: 1));
        bloc.add(InterviewCompletedEvent(id: 1));
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        LoadingState(),
        InterviewsLoaded(interviews: interviews),
        InterviewsLoaded(
          interviews: [interviews.first.copyWith(isCompleted: true)],
        )
      ],
    );
  });
}
