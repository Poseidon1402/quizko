import 'package:http/http.dart' as http;

import '../models/class_model.dart';

abstract class ClassSource {
  Future<List<ClassModel>> fetchAll();
}

class ClassSourceImpl implements ClassSource {
  final http.Client client;

  ClassSourceImpl({required this.client});

  @override
  Future<List<ClassModel>> fetchAll() async {
    return const [
      ClassModel(id: 1, name: 'M1 GID'),
      ClassModel(id: 2, name: 'M1 GBD'),
      ClassModel(id: 3, name: 'M1 ASR'),
    ];
  }
}
