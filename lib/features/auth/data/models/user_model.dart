import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final String? password;
  final String? token;

  const UserModel({
    required super.registrationNumber,
    required super.email,
    required super.gender,
    required super.fullName,
    super.levelId,
    this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String? token) =>
      UserModel(
        registrationNumber: json['candidate']['registration_number'],
        fullName: json['name'],
        email: json['email'],
        gender: json['candidate']['gender'],
        token: token,
        levelId: json['candidate']['post']['id'],
      );

  Map<String, dynamic> subscriptionJson() => {
        "registration_number": registrationNumber,
        "name": fullName,
        "email": email,
        "password": password,
        "gender": gender,
      };
}
