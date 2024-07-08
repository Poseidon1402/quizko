import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/features/account/domain/entity/class_entity.dart';
import 'package:quizko/features/auth/data/models/user_model.dart';
import 'package:quizko/features/auth/domain/entity/user_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  const userModel = UserModel(
    candidateId: 5,
    registrationNumber: "2310",
    fullName: "John Doe",
    email: "johndoe@gmail.com",
    gender: "masculine",
    classEntity: ClassEntity(id: 1, name: 'M1 GID'),
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