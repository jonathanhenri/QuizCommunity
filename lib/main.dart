import 'package:flutter/material.dart';
import 'package:quizcommunity/database/awanser_database.dart';
import 'package:quizcommunity/shared/models/awnser_model.dart';

import 'core/app_widget.dart';

Future<void> main() async {
  runApp(AppWidget());

  final dbHelper = AwnserDatabase.instance;

  // dbHelper.DropTableIfExistsThenReCreate();

  dbHelper.insert(AwnserModel(title: 'Primeira resposta').toMap());

  dbHelper.queryAllRows().then((map) => print(map.toString()));

}
