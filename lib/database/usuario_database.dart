import 'package:path/path.dart';
import 'package:quizcommunity/shared/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDatabase {

void createUsuario(UserModel userModel) {
    // getDatabasesPath().then((dbPath) {
    //   final String path = join(dbPath, 'quizcommunity.db');
    //   Future<int> future = openDatabase(
    //     path,
    //     onCreate: (db, version) {
    //       final Map<String, dynamic> userMap = Map();
    //       userMap['id'] = userModel.id;
    //       userMap['name'] = userModel.name;
    //       userMap['photoUrl'] = userModel.photoUrl;
    //       userMap['score'] = userModel.score;
    //       return db.insert('USER', userMap);
    //     },
    //     version: 1,
    //   );
    // });
  }
}