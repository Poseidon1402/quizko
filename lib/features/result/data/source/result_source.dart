import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/config/api_config.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/services/check_status_code.dart';
import '../models/result_question_model.dart';

abstract class ResultSource {
  Future<List<ResultQuestionModel>> fetchCorrections({
    required int candidateId,
    required int interviewId,
    required String token,
  });
}

class ResultSourceImpl implements ResultSource {
  final http.Client client;

  ResultSourceImpl({required this.client});

  @override
  Future<List<ResultQuestionModel>> fetchCorrections({
    required int candidateId,
    required int interviewId,
    required String token,
  }) async {
    try {
      http.Response response = await client.get(
        Uri.http(
          ApiConfig.baseUrl,
          'api/student-answers/$candidateId/$interviewId',
        ),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      print(response.body);
      if (isSuccess(response.statusCode)) {
        final decodedJson = json.decode(utf8.decode(response.bodyBytes));
        return (decodedJson['data'] as List<dynamic>)
            .map((question) => ResultQuestionModel.fromJson(question))
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
