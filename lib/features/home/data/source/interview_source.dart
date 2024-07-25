import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/config/api_config.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/services/check_status_code.dart';
import '../models/interview_model.dart';
import '../models/question_model.dart';

abstract class InterviewSource {
  Future<List<InterviewModel>> fetchInterviews(String token, int classId);
  Future<List<QuestionModel>> fetchRelatedQuestions({
    required String token,
    required int subjectId,
  });
  Future<int> submitQuiz({
    required String token,
    required int interviewId,
    required int candidateId,
    required List<Map<String, int>> answers,
  });
  Future<bool> isAlreadyCompleted({
    required String token,
    required int interviewId,
    required int candidateId,
  });
}

class InterviewSourceImpl implements InterviewSource {
  final http.Client client;

  InterviewSourceImpl({required this.client});

  @override
  Future<List<InterviewModel>> fetchInterviews(String token, int classId) async {
    try {
      http.Response response = await client
          .get(Uri.http(ApiConfig.baseUrl, '/api/tests/$classId'), headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });

      if (isSuccess(response.statusCode)) {
        final decodedJson = json.decode(utf8.decode(response.bodyBytes));
        return (decodedJson['data'] as List<dynamic>)
            .map((interview) => InterviewModel.fromJson(interview))
            .toList();
      } else {
        throw ServerException();
      }
    } on http.ClientException {
      throw InternetConnectionException();
    } on SocketException {
      throw ServerException();
    }
  }

  @override
  Future<List<QuestionModel>> fetchRelatedQuestions(
      {required String token, required int subjectId}) async {
    try {
      http.Response response = await client.get(
          Uri.http(ApiConfig.baseUrl, '/api/questions/$subjectId'),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          });

      if (isSuccess(response.statusCode)) {
        final decodedJson = json.decode(utf8.decode(response.bodyBytes));
        return (decodedJson['data']['questions'] as List<dynamic>)
            .map((question) => QuestionModel.fromJson(question))
            .toList();
      } else {
        throw ServerException();
      }
    } on http.ClientException {
      throw InternetConnectionException();
    } on SocketException {
      throw ServerException();
    }
  }

  @override
  Future<int> submitQuiz({
    required String token,
    required int interviewId,
    required int candidateId,
    required List<Map<String, int>> answers,
  }) async {
    try {
      http.Response response = await client.post(
        Uri.http(ApiConfig.baseUrl, '/api/answer'),
        body: json.encode({
          'candidate_id': candidateId,
          'interview_id': interviewId,
          'candidate_answers': answers,
        }),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      if (isSuccess(response.statusCode)) {
        final mark = json.decode(response.body);

        return mark['total_points'];
      } else {
        throw ServerException();
      }
    } on http.ClientException {
      throw InternetConnectionException();
    } on SocketException {
      throw ServerException();
    }
  }

  @override
  Future<bool> isAlreadyCompleted({
    required String token,
    required int interviewId,
    required int candidateId,
  }) async {
    try {
      http.Response response = await client.get(
        Uri.http(
          ApiConfig.baseUrl,
          '/api/is-student-passed/$interviewId/$candidateId',
        ),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      if (isSuccess(response.statusCode)) {
        final data = json.decode(response.body);

        return data['exists'];
      } else {
        throw ServerException();
      }
    } on http.ClientException {
      throw InternetConnectionException();
    } on SocketException {
      throw ServerException();
    }
  }
}
