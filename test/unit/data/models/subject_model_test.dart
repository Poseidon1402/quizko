import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/features/home/data/models/subject_model.dart';
import 'package:quizko/features/home/domain/entity/subject_entity.dart';

void main() {
  const subjectModel = SubjectModel(id: 1, name: 'Android');

  test('Should be a subclass of subject entity', () {
    expect(subjectModel, isA<SubjectEntity>());
  });

  test('Should return a valid subject model', () {
    Map<String, dynamic> json = {'id': 1, 'subject': 'Android'};

    final result = SubjectModel.fromJson(json);

    expect(result, equals(subjectModel));
  });
}
