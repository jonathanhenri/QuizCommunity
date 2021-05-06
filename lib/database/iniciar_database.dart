import 'package:quizcommunity/database/question_database.dart';
import 'package:quizcommunity/database/quiz_database.dart';
import 'package:quizcommunity/database/usuario_database.dart';
import 'package:quizcommunity/shared/models/awnser_model.dart';

import 'awanser_database.dart';

class IniciarDatabase {

  Future<void> mostrarTodasTabelas () async {
    print('AWNSER');
    print('---');
    final dbAwnser  = AwnserDatabase.instance;
    await dbAwnser.queryAllRows().then((value) => print(value.toString()));
    print('---');

    print('USER');
    print('---');
    final dbUser = UsuarioDatabase.instance;
    await dbUser.queryAllRows().then((value) => print(value.toString()));
    print('---');

    print('QUESTION');
    print('---');
    final dbQuestion = QuestionDatabase.instance;
    await dbQuestion.queryAllRows().then((value) => print(value.toString()));
    print('---');

    print('QUIZ');
    print('---');
    final dbQuiz = QuizDatabase.instance;
    await dbQuiz.queryAllRows().then((value) => print(value.toString()));
    print('---');
  }


  void reiniciarTodasTabelas () {
    print('AWNSER');
    print('---');
    final dbAwnser  = AwnserDatabase.instance;
    dbAwnser.dropTableIfExistsThenReCreate();
    print('---');

    print('USER');
    print('---');
    final dbUser = UsuarioDatabase.instance;
    dbUser.dropTableIfExistsThenReCreate();
    print('---');

    print('QUESTION');
    print('---');
    final dbQuestion = QuestionDatabase.instance;
    dbQuestion.dropTableIfExistsThenReCreate();
    print('---');

    print('QUIZ');
    print('---');
    final dbQuiz = QuizDatabase.instance;
    dbQuiz.dropTableIfExistsThenReCreate();
    print('---');
  }
}