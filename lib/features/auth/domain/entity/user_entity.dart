import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String registrationNumber;
  final String fullName;
  final String email;
  final String gender;

  const UserEntity({
    required this.registrationNumber,
    required this.fullName,
    required this.email,
    required this.gender
  });

  @override
  List<Object?> get props => [registrationNumber, fullName, email, gender];
}