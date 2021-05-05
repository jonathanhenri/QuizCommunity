import 'dart:convert';

import 'package:quizcommunity/shared/models/question_model.dart';

class AwnserModel {
  final String title;
  final bool isRight;
  QuestionModel? questionModel;

  AwnserModel({
    required this.title,
    this.isRight = false,
    this.questionModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'is_right': isRight ? 1 : 0,
      'ID_QUESTION': questionModel != null ? questionModel!.id : 0,
    };
  }

  factory AwnserModel.fromMap(Map<String, dynamic> map) {
    return AwnserModel(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnserModel.fromJson(String source) =>
      AwnserModel.fromMap(json.decode(source));
}
