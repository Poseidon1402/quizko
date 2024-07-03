import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String registrationNumber;
  final String fullName;
  final String email;
  final String gender;
  final int candidateId;

  const UserEntity({
    required this.registrationNumber,
    required this.fullName,
    required this.email,
    required this.gender,
    required this.candidateId,
  });

  @override
  List<Object?> get props => [
        candidateId,
        registrationNumber,
        fullName,
        email,
        gender,
      ];
}
