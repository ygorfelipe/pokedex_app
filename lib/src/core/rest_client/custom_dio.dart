//! FORMA MAIS SIMPLES DO DIO
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(
          BaseOptions(
            //! quando for utilizar em banco de dados interno, favor adicionar a base_url_correta
            baseUrl: Env.instance.get('base_url_git'),
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  CustomDio auth() {
    return this;
  }

  CustomDio unauth() {
    return this;
  }
}
