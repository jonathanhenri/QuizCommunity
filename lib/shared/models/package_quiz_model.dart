import 'package:quizcommunity/shared/models/quiz_model.dart';

class PackageQuizModel {
  final String nome;
  final String descricao;
  final List<QuizModel> listaQuizzes;

  PackageQuizModel({
    required this.nome,
    required this.descricao,
    required this.listaQuizzes,
  });
}
