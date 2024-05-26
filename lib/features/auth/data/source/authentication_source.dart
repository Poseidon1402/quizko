import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/config/api_config.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/services/check_status_code.dart';
import '../models/user_model.dart';

abstract class AuthenticationSource {
  Future<UserModel> subscribeUser(UserModel newUser);
  Future<UserModel> authenticate(String email, String password);
}

class AuthenticationSourceImpl implements AuthenticationSource {
  final http.Client client;

  AuthenticationSourceImpl({required this.client});

  @override
  Future<UserModel> subscribeUser(UserModel newUser) async {
    try {
      http.Response response = await client.post(
        Uri.http(ApiConfig.baseUrl, '/api/subscribe'),
        body: newUser.subscriptionJson(),
      );

      final decodedJson = json.decode(utf8.decode(response.bodyBytes));
      if(isSuccess(response.statusCode)) {
        return UserModel.fromJson(decodedJson['user'], decodedJson['token']);
      } else if (response.statusCode == 400) {
        throw BadRequestException(message: decodedJson['message']);
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
  Future<UserModel> authenticate(String email, String password) async {
    try {
      http.Response response = await client.post(
        Uri.http(ApiConfig.baseUrl, '/api/login'),
        body: {
          'email': email,
          'password': password,
        }
      );

      if(isSuccess(response.statusCode)) {
        final decodedJson = json.decode(utf8.decode(response.bodyBytes));
        return UserModel.fromJson(decodedJson['user'], decodedJson['token']);
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
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