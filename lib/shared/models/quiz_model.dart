import 'dart:convert';

import 'package:quizcommunity/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

class QuizModel {
  final String title;
  List<QuestionModel> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;
  int? id;



  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.imagem,
    required this.level,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  Map<String, dynamic> toMapDb() {
    return {
      'title': title,
      'QUESTION_ANSWERED': questionAnswered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      // questions: List<QuestionModel>.from(
      //     map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questions: [],
      questionAnswered: map['QUESTION_ANSWERED'],
      imagem: map['imagem'],
      level: map['LEVEL'].toString().levelParse,
      id: map['ID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}

extension LevelStringExt on String {
  Level get levelParse => {
    "facil": Level.facil,
    "medio": Level.medio,
    "dificil": Level.dificil,
    "perito": Level.perito,
  }[this]!;
}

extension LevelExt on Level {
  String get parse => {
    Level.facil: "facil",
    Level.medio: "medio",
    Level.dificil: "dificil",
    Level.perito: "perito",
  }[this]!;
}

