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
    this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String? token) =>
      UserModel(
        candidateId: json['candidate']['id'],
        registrationNumber: json['candidate']['registration_number'],
        fullName: json['name'],
        email: json['email'],
        gender: json['candidate']['gender'],
        token: token,
      );

  Map<String, dynamic> subscriptionJson() => {
        "registration_number": registrationNumber,
        "name": fullName,
        "email": email,
        "password": password,
        "gender": gender,
      };

  Map<String, dynamic> updateJson() => {
    "registration_number": registrationNumber,
    "name": fullName,
    "email": email,
    "gender": gender,
  };
}
