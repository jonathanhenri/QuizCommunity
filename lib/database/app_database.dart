import 'package:path/path.dart';
import 'package:quizcommunity/shared/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

// Future<Database> createDatabase() {
//   return getDatabasesPath().then((dbPath) {
//     final String path = join(dbPath, 'quizcommunity.db');
//     return openDatabase(
//       path,
//       onCreate: (db, version) {
//         db.execute('CREATE TABLE USER('
//                 'ID INTEGER PRIMARY KEY, '
//                 'NAME TEXT, '
//                 'PHOTO_URL TEXT, '
//                 'SCORE INTEGER )');
//       },
//       version: 1,
//     );
//   });
// }

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'quizcommunity.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('CREATE TABLE user('
            'id INTEGER PRIMARY KEY, '
            'NAME TEXT, '
            'PHOTO_URL TEXT, '
            'SCORE INTEGER)');
      },
      version: 2,
      onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(UserModel userModel) {
  return createDatabase().then((db) {
    return db.insert('user', userModel.toMap());
  });
}

// Future<int> save(UserModel userModel) {
//   return createDatabase().then((db) {
//     final Map<String, dynamic> userMap = Map();
//     return db.insert('USER', userModel.toMap());
//   });
// }

Future<List<UserModel>> findAll() {
  return createDatabase().then((db) {
    return db.query(UserModel.getNameTable()).then((maps) {
      List<UserModel> users = List<UserModel>.empty();

      for (Map<String, dynamic> map in maps) {
        UserModel userModel = UserModel.fromMap(map);
        users.add(userModel);
      }

      return users;
    });
  });
}

// Future<Database> createTableUsuario(String path) {
//   return openDatabase(
//     path,
//     onCreate: (db, version) {
//       db.execute('CREATE TABLE USER('
//           'ID INTEGER PRIMARY KEY, '
//           'NAME TEXT, '
//           'PHOTO_URL TEXT, '
//           'SCORE INTEGER ');
//     },
//     version: 1,
//   );
// }
