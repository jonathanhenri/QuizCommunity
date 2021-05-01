import 'package:flutter/material.dart';
import 'package:quizcommunity/database/app_database.dart';
import 'package:quizcommunity/shared/models/user_model.dart';

import 'core/app_widget.dart';

Future<void> main() async {
  runApp(AppWidget());
  save(UserModel(name: 'Jonathan', photoUrl: 'teste', score: 75)).then((id) {
    findAll().then((users) => debugPrint(users.toString()));
  });
}
