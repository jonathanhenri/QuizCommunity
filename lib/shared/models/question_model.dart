import 'dart:convert';

import 'package:quizcommunity/shared/models/awnser_model.dart';
import 'package:quizcommunity/shared/models/quiz_model.dart';

class QuestionModel {
  final String title;
  final List<AwnserModel> awnsers;
  int? id;
  QuizModel? quizModel;



  QuestionModel({required this.title, required this.awnsers,this.id, this.quizModel});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'awnsers': awnsers.map((x) => x.toMap()).toList(),
    };
  }

  Map<String, dynamic> toMapDb() {
    return {
      'title': title,
      'id_quiz': quizModel != null ? quizModel!.id: 0
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      awnsers: List<AwnserModel>.from(
          map['awnsers']?.map((x) => AwnserModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
