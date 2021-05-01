
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizcommunity/shared/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

import 'database_comum.dart';

class QuizDatabase extends DatabaseComum {
  // tem somente uma referência ao banco de dados
  static final _databaseName = "quizcommunity.db";

  static Database? database;

  // torna esta classe singleton
  QuizDatabase._privateConstructor();

  static final QuizDatabase instance = QuizDatabase._privateConstructor();

  @override
  Future<Database> get databaseSingle async {
    if (database != null) return database!;
    // instancia o db na primeira vez que for acessado
    database = await _initDatabase();
    return database!;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: getDataBaseVersion(),
      onCreate: (db, version) {
        db.execute(
          getScriptOnCreate(),
        );
      },
    );
  }

  Future<List<UserModel>> queryAllRowsUsers() async {
    Future<List<Map<String, dynamic>>> futureListMap = queryAllRows();
    List<UserModel> listModel = List<UserModel>.empty();

    futureListMap.then((listMap) {
      for (Map<String, dynamic> valueMap in listMap) {
        UserModel userModel = UserModel.fromMap(valueMap);
        listModel.add(userModel);
      }
    });

    return listModel;
  }


  String getScriptOnCreate() {
    return '''
          CREATE TABLE $getTable() (
            ID INTEGER PRIMARY KEY,
            TITLE TEXT NOT NULL,
            IMAGEM TEXT NOT NULL,
            LEVEL TEXT NOT NULL,
            QUESTION_ANSWERED INTEGER NOT NULL,
            
          )
          ''';
  }

  @override
  String getTable() {
    return "quiz";
  }

  int getDataBaseVersion() {
    return 1;
  }
}
