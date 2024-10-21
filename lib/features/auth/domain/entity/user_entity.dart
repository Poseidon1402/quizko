import 'package:equatable/equatable.dart';

import '../../../account/domain/entity/class_entity.dart';

class UserEntity extends Equatable {
  final String candidateId;
  final String registrationNumber;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final ClassEntity classEntity;

  const UserEntity({
    required this.candidateId,
    required this.registrationNumber,
    this.firstName = '',
    required this.lastName,
    required this.email,
    required this.gender,
    this.phone = '',
    required this.classEntity,
  });

  get fullName => '$lastName $firstName';

  @override
  List<Object?> get props => [
        candidateId,
        registrationNumber,
        firstName,
        lastName,
        email,
        phone,
        gender,
        classEntity,
      ];
}
