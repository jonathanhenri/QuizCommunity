import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizcommunity/shared/models/question_model.dart';
import 'package:quizcommunity/shared/models/quiz_model.dart';
import 'package:sqflite/sqflite.dart';

class AwnserDatabase {
  static final _databaseName = "quizcommunity.db";
  static final _databaseVersion = 1;
  static final table = 'awnser';

  // torna esta classe singleton
  AwnserDatabase._privateConstructor();

  static final AwnserDatabase instance = AwnserDatabase._privateConstructor();

  // tem somente uma referência ao banco de dados
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // instancia o db na primeira vez que for acessado
    _database = await initDB();
    return _database!;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE $table (
            ID INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            is_right  INTEGER NOT NULL,
            ID_QUESTION INTEGER NOT NULL
          )
          ''');
    });
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            ID INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            is_right  INTEGER NOT NULL,
            ID_QUESTION INTEGER NOT NULL
          )
          ''');
  }


  // métodos Helper
  //----------------------------------------------------
  // Insere uma linha no banco de dados onde cada chave
  // no Map é um nome de coluna e o valor é o valor da coluna.
  // O valor de retorno é o id da linha inserida.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // Todas as linhas são retornadas como uma lista de mapas, onde cada mapa é
  // uma lista de valores-chave de colunas.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<QuestionModel>> queryAllRowsQuestion() async {
    Future<List<Map<String, dynamic>>> futureListMap = queryAllRows();
    List<QuestionModel> listModel = [];

    futureListMap.then((listMap) {
      for (Map<String, dynamic> valueMap in listMap) {
        QuestionModel questionModel = QuestionModel.fromMap(valueMap);
        listModel.add(questionModel);
      }
    });

    return listModel;
  }

  // Todos os métodos : inserir, consultar, atualizar e excluir,
  // também podem ser feitos usando  comandos SQL brutos.
  // Esse método usa uma consulta bruta para fornecer a contagem de linhas.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // Assumimos aqui que a coluna id no mapa está definida. Os outros
  // valores das colunas serão usados para atualizar a linha.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['ID'];
    return await db.update(table, row, where: 'ID = ?', whereArgs: [id]);
  }

  // Exclui a linha especificada pelo id. O número de linhas afetadas é
  // retornada. Isso deve ser igual a 1, contanto que a linha exista.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'ID = ?', whereArgs: [id]);
  }

  Future<void> dropTableIfExistsThenReCreate() async {

    //here we get the Database object by calling the openDatabase method
    //which receives the path and onCreate function and all the good stuff
    Database db = await instance.database;

    //here we execute a query to drop the table if exists which is called "tableName"
    //and could be given as method's input parameter too
    await db.execute("DROP TABLE IF EXISTS $table");

    //and finally here we recreate our beloved "tableName" again which needs
    //some columns initialization
    await db.execute('''
          CREATE TABLE $table (
            ID INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            is_right  INTEGER NOT NULL,
            ID_QUESTION INTEGER NOT NULL
          )
          ''');
  }
}
