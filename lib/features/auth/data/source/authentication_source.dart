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
  Future<String> forgotPassword(String email);
  Future<String> verifyResetCode(String email, String token);
  Future<String> resetPassword(String email, String token, String password);
  Future<String> updatePassword({
    required String currentPassword,
    required String password,
    required String token,
  });
  Future<UserModel> getCurrentUser(String token);
  Future<UserModel> updateUser(
      {required UserModel user, required String token});
}

class AuthenticationSourceImpl implements AuthenticationSource {
  final http.Client httpClient;

  AuthenticationSourceImpl({required this.httpClient});

  @override
  Future<UserModel> subscribeUser(UserModel newUser) async {
    try {
      http.Response response = await httpClient.post(
          Uri.https(ApiConfig.baseUrl, '/api/auth/subscription'),
          body: newUser.subscriptionJson(),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          });

      final decodedJson = json.decode(utf8.decode(response.bodyBytes));
      if (isSuccess(response.statusCode)) {
        return UserModel.fromJson(decodedJson['user'], decodedJson['accessToken']);
      } else if (response.statusCode == 409) {
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
      http.Response response = await httpClient
          .post(Uri.https(ApiConfig.baseUrl, '/api/auth/login'), body: {
        'email': email,
        'password': password,
      });

      if (isSuccess(response.statusCode)) {
        final decodedJson = json.decode(utf8.decode(response.bodyBytes));
        return UserModel.fromJson(decodedJson['user'], decodedJson['token']);
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else if (response.statusCode == 404) {
        throw NotFoundException();
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
  Future<String> forgotPassword(String email) async {
    try {
      http.Response response = await httpClient.post(
        Uri.http(ApiConfig.baseUrl, '/api/send-reset-code'),
        body: {'email': email},
      );

      if (isSuccess(response.statusCode)) {
        return 'Reinitialization code sent !';
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
  Future<String> verifyResetCode(String email, String token) async {
    try {
      http.Response response = await httpClient.post(
        Uri.http(ApiConfig.baseUrl, '/api/verify-reset-code'),
        body: {
          'email': email,
          'token': token,
        },
      );

      if (isSuccess(response.statusCode)) {
        return 'Valid reset code';
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
  Future<String> resetPassword(
      String email, String token, String password) async {
    try {
      http.Response response = await httpClient.post(
        Uri.http(ApiConfig.baseUrl, '/api/new-password'),
        body: {
          'email': email,
          'token': token,
          'new_password': password,
        },
      );

      if (isSuccess(response.statusCode)) {
        return 'Password reset done';
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
  Future<String> updatePassword({
    required String currentPassword,
    required String password,
    required String token,
  }) async {
    try {
      http.Response response = await httpClient.patch(
        Uri.https(ApiConfig.baseUrl, '/api/users/password'),
        body: {
          'currentPassword': currentPassword,
          'newPassword': password,
        },
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      if (isSuccess(response.statusCode)) {
        return 'Updated successfully';
      } else if (response.statusCode == 401) {
        throw InvalidDataException();
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
  Future<UserModel> getCurrentUser(String token) async {
    try {
      http.Response response = await httpClient
          .get(Uri.https(ApiConfig.baseUrl, '/api/users/me'), headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });

      if (isSuccess(response.statusCode)) {
        final decodedJson = json.decode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;

        return UserModel.fromJson(decodedJson['user'], decodedJson['accessToken']);
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
  Future<UserModel> updateUser(
      {required UserModel user, required String token}) async {
    try {
      final response = await httpClient.patch(
        Uri.https(ApiConfig.baseUrl, '/api/users/me'),
        body: user.updateJson(),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      final decodedJson = json.decode(utf8.decode(response.bodyBytes));

      if (isSuccess(response.statusCode)) {
        return UserModel.fromJson(decodedJson, null);
      } else if(response.statusCode == 409) {
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
}
