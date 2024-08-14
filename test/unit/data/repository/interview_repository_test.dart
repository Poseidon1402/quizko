import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quizko/core/error/exceptions.dart';
import 'package:quizko/core/error/failures.dart';
import 'package:quizko/core/utils/services/date_converter_service.dart';
import 'package:quizko/features/home/data/models/answer_model.dart';
import 'package:quizko/features/home/data/models/interview_model.dart';
import 'package:quizko/features/home/data/models/question_model.dart';
import 'package:quizko/features/home/data/models/subject_model.dart';
import 'package:quizko/features/home/data/repository/interview_repository_impl.dart';
import 'package:quizko/features/home/domain/entity/interview_entity.dart';
import 'package:quizko/features/home/domain/entity/subject_entity.dart';
import 'package:quizko/features/result/data/models/result_answer_model.dart';
import 'package:quizko/features/result/data/models/result_question_model.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockInterviewSource mockInterviewSource;
  late MockResultSource mockResultSource;
  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late InterviewRepositoryImpl interviewRepositoryImpl;

  setUp(() {
    mockInterviewSource = MockInterviewSource();
    mockResultSource = MockResultSource();
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    interviewRepositoryImpl = InterviewRepositoryImpl(
      interviewSource: mockInterviewSource,
      resultSource: mockResultSource,
      secureStorage: mockFlutterSecureStorage,
    );
  });

  group('Fetch interviews', () {
    final interviews = [
      InterviewModel(
        id: 1,
        name: 'Test Android 1',
        duration: DateConverterService.convertToDuration("00:30:00"),
        subject: const SubjectModel(
          id: 1,
          name: 'QCM Android 1',
        ),
      ),
    ];

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

    final expected = [
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

    test('Should return a valid list of interview entity', () async {
      when(
        mockFlutterSecureStorage.read(key: 'token'),
      ).thenAnswer((_) async => 'token');
      when(
        mockInterviewSource.fetchInterviews('token', 1),
      ).thenAnswer((_) async => interviews);
      when(
        mockInterviewSource.fetchRelatedQuestions(token: 'token', subjectId: 1),
      ).thenAnswer((_) async => questions);
      when(mockInterviewSource.isAlreadyCompleted(
        token: 'token',
        interviewId: 1,
        candidateId: 1,
      )).thenAnswer((_) async => false);

      final result = await interviewRepositoryImpl.fetchInterviews(
        candidateId: 1,
        classId: 1,
      );

      result.fold(
        (failure) => null,
        (interviews) => expect(interviews, equals(expected)),
      );
    });

    test('Should return a server failure on server exception', () async {
      when(
        mockFlutterSecureStorage.read(key: 'token'),
      ).thenAnswer((_) async => 'token');
      when(
        mockInterviewSource.fetchInterviews('token', 1),
      ).thenThrow(ServerException());

      final result = await interviewRepositoryImpl.fetchInterviews(
        candidateId: 1,
        classId: 1,
      );

      result.fold(
        (failure) => expect(failure, const ServerFailure()),
        (success) => null,
      );
    });
  });

  group('Fetch corrections', () {
    const corrections = [
      ResultQuestionModel(
        label: 'Question 1',
        answers: [
          ResultAnswerModel(
            label: 'Answer 1',
            isCorrect: false,
            isCandidateAnswer: false,
          ),
          ResultAnswerModel(
            label: 'Answer 2',
            isCorrect: true,
            isCandidateAnswer: true,
          ),
          ResultAnswerModel(
            label: 'Answer 3',
            isCorrect: false,
            isCandidateAnswer: false,
          ),
          ResultAnswerModel(
            label: 'Answer 4',
            isCorrect: false,
            isCandidateAnswer: false,
          ),
        ],
      )
    ];

    test('Should return a valid list of result question entity', () async {
      when(
        mockFlutterSecureStorage.read(key: 'token'),
      ).thenAnswer((_) async => 'token');
      when(mockResultSource.fetchCorrections(
        candidateId: 1,
        interviewId: 1,
        token: 'token',
      )).thenAnswer((_) async => corrections);

      final result = await interviewRepositoryImpl.fetchCorrections(
        candidateId: 1,
        interviewId: 1,
      );

      expect(result, equals(const Right(corrections)));
    });

    test('Should return a server failure', () async {
      when(
        mockFlutterSecureStorage.read(key: 'token'),
      ).thenAnswer((_) async => 'token');
      when(mockResultSource.fetchCorrections(
        candidateId: 1,
        interviewId: 1,
        token: 'token',
      )).thenThrow(ServerException());

      final result = await interviewRepositoryImpl.fetchCorrections(
        candidateId: 1,
        interviewId: 1,
      );

      expect(result, equals(const Left(ServerFailure())));
    });
  });
}
