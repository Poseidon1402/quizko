import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/config/api_config.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/services/check_status_code.dart';
import '../models/class_model.dart';

abstract class ClassSource {
  Future<List<ClassModel>> fetchAll();
}

class ClassSourceImpl implements ClassSource {
  final http.Client client;

  ClassSourceImpl({required this.client});

  @override
  Future<List<ClassModel>> fetchAll() async {
    try {
      http.Response response = await client.get(
        Uri.http(ApiConfig.baseUrl, '/api/levels'),
      );

      if(isSuccess(response.statusCode)) {
        final decodedJson = json.decode(utf8.decode(response.bodyBytes));
        return (decodedJson as List<dynamic>).map((item) => ClassModel.fromJson(item)).toList();
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
