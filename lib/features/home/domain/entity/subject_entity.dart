import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final String id;
  final String name;

  const SubjectEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
