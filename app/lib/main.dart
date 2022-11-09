import 'package:app/app/app.dart';
import 'package:app/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
