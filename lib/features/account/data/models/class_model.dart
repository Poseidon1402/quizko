import '../../domain/entity/class_entity.dart';

class ClassModel extends ClassEntity {
  const ClassModel({
    required super.id,
    required super.level,
    required super.category,
    super.group,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        id: json['id'],
        level: json['level']['label'],
        category: json['category']['label'],
        group: json['group'] ?? '',
      );
}
