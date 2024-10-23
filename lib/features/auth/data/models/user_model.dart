import 'dart:convert';

import '../../../account/data/models/class_model.dart';
import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final String? password;
  final String? token;

  const UserModel({
    required super.candidateId,
    required super.registrationNumber,
    super.firstName,
    required super.lastName,
    required super.email,
    required super.gender,
    super.phone = '',
    required super.classEntity,
    this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String? token) =>
      UserModel(
        candidateId: json['id'],
        registrationNumber: json['registrationNumber'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phone: json['phone'] ?? '',
        gender: json['gender'],
        classEntity: ClassModel.fromJson(json['class']),
        token: token,
      );

  String subscriptionJson() => json.encode({
        "registrationNumber": registrationNumber,
        "lastName": lastName,
        "firstName": firstName,
        "email": email,
        "password": password,
        'phone': phone,
        "gender": gender,
        "classId": classEntity.id,
      });

  String updateJson() => jsonEncode({
        "registrationNumber": registrationNumber,
        "lastName": lastName,
        "firstName": firstName,
        "email": email,
        "phone": phone,
        "gender": gender,
        "classId": classEntity.id,
      });
}
