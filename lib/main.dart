import 'package:flutter/material.dart';

import 'core/app_widget.dart';
import 'database/iniciar_database.dart';

Future<void> main() async {
  runApp(AppWidget());

  IniciarDatabase iniciarDatabase = new IniciarDatabase();
  iniciarDatabase.mostrarTodasTabelas();

}
