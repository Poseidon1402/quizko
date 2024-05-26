import '../../../../core/utils/services/date_converter_service.dart';
import '../../domain/entity/interview_entity.dart';
import 'subject_model.dart';

class InterviewModel extends InterviewEntity {
  const InterviewModel({
    required super.id,
    required super.name,
    required super.duration,
    required super.subject,
  });

  factory InterviewModel.fromJson(Map<String, dynamic> json) => InterviewModel(
        id: json['id'],
        name: json['name'],
        duration: DateConverterService.convertToDuration(json['time']),
        subject: SubjectModel.fromJson(json['subject']),
      );
}
