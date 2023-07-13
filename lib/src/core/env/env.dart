import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Env? _instance;

  Env._();

  static Env get instance {
    _instance ??= Env._();
    return _instance!;
  }

  //! 3 metodos importantes

  //* load() faz/leitura o carregamento das var de ambient
  Future<void> load() => dotenv.load();

  //* irá buscar a chave que estou pedindo, se não existir não tera problema, ver nos projetos antigos
  String? maybeGet(String key) => dotenv.maybeGet(key);

  //* irá buscar a chave no arquivo de config, se não existir ira subir um erro
  String get(String key) => dotenv.get(key);

  //! NAO ESQUECER DE ADICIONAR NO ASSETS O .ENV
}
