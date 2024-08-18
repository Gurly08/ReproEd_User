

import 'test_type_model.dart';

class QuizModel {
  final String name;
  final String type;
  final String description;
  final int duration;
  final String kategori;

  QuizModel({
    required this.name,
    required this.type,
    required this.description,
    required this.duration,
    required this.kategori,
  });

  TestType get testType => TestType.fromValue(type);
}