

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class APIClient{

  final Dio _dio = Dio();

  APIClient(){
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.options.headers['Content-Type'] = 'application/json';
  }

  Dio get sendRequest => _dio;
  
}