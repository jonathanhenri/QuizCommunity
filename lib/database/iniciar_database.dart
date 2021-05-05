import 'package:quizcommunity/database/question_database.dart';
import 'package:quizcommunity/database/quiz_database.dart';
import 'package:quizcommunity/database/usuario_database.dart';
import 'package:quizcommunity/shared/models/awnser_model.dart';

import 'awanser_database.dart';

class IniciarDatabase {

  void criarTodasTabelas () {
    final dbAwnser  = AwnserDatabase.instance;
    dbAwnser.queryAllRows().then((value) => print(value.toString()));

    final dbUser = UsuarioDatabase.instance;
    dbUser.queryAllRows().then((value) => print(value.toString()));

    final dbQuestion = QuestionDatabase.instance;
    dbQuestion.queryAllRows().then((value) => print(value.toString()));

    final dbQuiz = QuizDatabase.instance;
    dbQuiz.queryAllRows().then((value) => print(value.toString()));
  }
}