import 'package:equatable/equatable.dart';

class ClassEntity extends Equatable {
  final String id;
  final String group;
  final String level;
  final String category;

  const ClassEntity({
    required this.id,
    required this.level,
    required this.category,
    this.group = '',
  });

  get name => '$level $category $group';

  @override
  List<Object?> get props => [id, level, category, group];
}
