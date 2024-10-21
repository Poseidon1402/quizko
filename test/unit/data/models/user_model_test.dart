import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/features/account/data/models/class_model.dart';
import 'package:quizko/features/auth/data/models/user_model.dart';
import 'package:quizko/features/auth/domain/entity/user_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  var userModel = const UserModel(
    candidateId: '9ee237c7-1655-46dd-bcae-c055c366b32e',
    registrationNumber: "2244",
    lastName: 'Mirana',
    firstName: 'Seheno',
    email: "student1@gmail.com",
    gender: "MALE",
    phone: "+261340000000",
    classEntity: ClassModel(
      id: '5afab7e4-877d-426c-a506-07bf9bcdb8ad',
      group: '',
      level: 'L2',
      category: 'GB',
    ),
  );

  test('should be a subsclass of user entity', () {
    expect(userModel, isA<UserEntity>());
  });

  test('should return a valid user model from json', () {
    // Arrange
    final Map<String, dynamic> user = json.decode(readJson('helpers/dummy_data/dummy_user.json'));

    // Act
    final result = UserModel.fromJson(user, 'token');

    // Assert
    expect(result, equals(userModel));
  });
}