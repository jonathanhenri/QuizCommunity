import 'package:flutter/material.dart';
import 'package:quizcommunity/shared/models/quiz_model.dart';

import 'core/app_widget.dart';
import 'database/quiz_database.dart';

Future<void> main() async {
  runApp(AppWidget());

  final dbHelper = QuizDatabase.instance;

  dbHelper.insert(QuizModel(title: 'Primeiro Quiz', questions: [], imagem: 'imagem', level: Level.facil).toMapDb());

}
