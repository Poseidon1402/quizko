import 'package:flutter_test/flutter_test.dart';
import 'package:quizko/features/home/data/models/interview_model.dart';
import 'package:quizko/features/home/data/models/subject_model.dart';
import 'package:quizko/features/home/domain/entity/interview_entity.dart';

void main() {
  const interviewModel = InterviewModel(
    id: 1,
    name: 'Interview 1',
    duration: Duration(minutes: 30),
    subject: SubjectModel(id: 1, name: 'Android'),
  );

  test('Should be a subclass of interview entity', () {
    expect(interviewModel, isA<InterviewEntity>());
  });

  test('Should return a valid interview model', () {
    Map<String, dynamic> json = {
      "id": 1,
      "name": "Interview 1",
      "time": "00:30:00",
      "subject": {'id': 1, 'subject': 'Android'}
    };

    final result = InterviewModel.fromJson(json);

    expect(result, equals(interviewModel));
  });
}
