import 'package:dio/io.dart';
import 'package:dio/dio.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(
          BaseOptions(
            baseUrl: 'http://192.168.3.7:8080',
            connectTimeout: Duration(seconds: 10),
            receiveTimeout: Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        request: true,
        responseBody: true,
      ),
    ]);
  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;

  }RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
