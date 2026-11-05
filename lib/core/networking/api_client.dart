

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


@lazySingleton
class APIClient{

  final Dio _dio = Dio();

  APIClient(){
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.interceptors.add(PrettyDioLogger());
    _dio.interceptors.add(DioInterceptor(dio: _dio));
  }

  Dio get sendRequest => _dio;
  
}


class DioInterceptor implements Interceptor{

  final Dio dio;
  final int maxRetries;
  final Duration retryInterval;
  int retryCount = 0;


  DioInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryInterval = const Duration(seconds: 2),
  });


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST: method: ${options.method} url: ${options.uri}');

    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE: ${response.statusCode} '
          '${response.requestOptions.uri}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    debugPrint(
      'ERROR: ${err.response?.statusCode} '
          '${err.requestOptions.uri}',
    );

    debugPrint("retryCount: $retryCount maxRetries: $maxRetries");

    // int retryCount = err.requestOptions.extra['retryCount'] ?? 0;

    if(_shouldRetry(err) && maxRetries > retryCount){

      if (retryCount < maxRetries) {
        retryCount++;
        // err.requestOptions.extra['retryCount'] = retryCount;

        // Wait before retrying (exponential backoff can also be applied here)
        await Future.delayed(const Duration(seconds: 2));

        try {
          // Retry the request with the original options
          final response = await dio.fetch(err.requestOptions);

          debugPrint("retry response data: ${response.data} ");

          return handler.resolve(response);

        } catch (e) {
          handler.next(err);
        }
      }

    }else{
      handler.next(err);
    }
  }


  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response != null && _isServerError(err.response?.statusCode));
  }

  bool _isServerError(int? statusCode) {
    if (statusCode == null) return false;
    return statusCode >= 500 && statusCode < 600;
  }

}