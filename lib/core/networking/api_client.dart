

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


@lazySingleton
class APIClient{

  final Dio _dio = Dio();

  APIClient(){
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
  
}