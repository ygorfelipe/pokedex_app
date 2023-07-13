import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'src/core/env/env.dart';
import './src/app_module.dart';
import './src/app_widget.dart';

Future<void> main() async {
  //* irá iniciar o flutter antes da aplicação
  WidgetsFlutterBinding.ensureInitialized();
  await Env.instance.load();
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
