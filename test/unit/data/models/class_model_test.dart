import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/features/account/data/models/class_model.dart';
import 'package:quizko/features/account/domain/entity/class_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  const classModel = ClassModel(
    id: 'bf94a726-5934-4339-9efe-f41f0ebb1da8',
    group: 'G1',
    level: 'L1',
    category: 'GB',
  );

  test('Should be a subclass of class entity', () {
    expect(classModel, isA<ClassEntity>());
  });

  test('Should return a valid class model', () {
    final Map<String, dynamic> map =
        json.decode(readJson('helpers/dummy_data/dummy_class.json'));

    final result = ClassModel.fromJson(map);

    expect(result, classModel);
  });
}
