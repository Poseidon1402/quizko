import 'dart:convert';

import '../../../account/domain/entity/class_entity.dart';
import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final String? password;
  final String? token;

  const UserModel({
    super.candidateId = 0,
    required super.registrationNumber,
    required super.email,
    required super.gender,
    required super.fullName,
    super.phone = '',
    required super.classEntity,
    this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String? token) =>
      UserModel(
        candidateId: json['candidate']['id'],
        registrationNumber: json['candidate']['registration_number'],
        fullName: json['name'],
        email: json['email'],
        phone: json['phone'] ?? '',
        gender: json['candidate']['gender'],
        classEntity: const ClassEntity(
          id: 1,
          name: 'M1 GBD',
        ),
        token: token,
      );

  String subscriptionJson() => json.encode({
        "registration_number": registrationNumber,
        "name": fullName,
        "email": email,
        "password": password,
        'phone': phone,
        "gender": gender,
        "post_id": classEntity.id,
      });

  Map<String, dynamic> updateJson() => {
        "registration_number": registrationNumber,
        "name": fullName,
        "email": email,
        "phone": phone,
        "gender": gender,
      };
}
