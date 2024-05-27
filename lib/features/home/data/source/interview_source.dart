import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/config/api_config.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/services/check_status_code.dart';
import '../models/interview_model.dart';
import '../models/question_model.dart';

abstract class InterviewSource {
  Future<List<InterviewModel>> fetchInterviews(String token);
  Future<List<QuestionModel>> fetchRelatedQuestions({
    required String token,
    required int subjectId,
  });
}

class InterviewSourceImpl implements InterviewSource {
  final http.Client client;

  InterviewSourceImpl({required this.client});

  @override
  Future<List<InterviewModel>> fetchInterviews(String token) async {
    try {
      http.Response response = await client
          .get(Uri.http(ApiConfig.baseUrl, '/api/tests/1'), headers: {
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
}
