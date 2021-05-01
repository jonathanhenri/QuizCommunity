import 'package:quizcommunity/shared/models/sub_categoria_model.dart';

class CategoriaModel {
  final String nome;
  final List<SubCategoriaModel> listaSubCategoria;

  CategoriaModel({required this.nome,required this.listaSubCategoria});
}