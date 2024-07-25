import 'package:equatable/equatable.dart';

class ClassEntity extends Equatable {
  final int id;
  final String name;

  const ClassEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
