


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_pro/core/networking/api_client.dart';
import 'package:test_pro/testing/user.dart';

class UserDetailsRepository{
  
  APIClient apiClient;

  UserDetailsRepository(this.apiClient);

  Future getUsers(String id)async{
      
    try{

      Response response = await apiClient.sendRequest.get('/users/$id');
      
      switch(response.statusCode){
        case 200: 
          User user = User.fromJson(response.data);
          return user;
        case 500: 
          return Exception("Server Error");
        case 404: 
           return Exception("Sever not found");
        case 402:
          return Exception("Invalid Request");
        default: 
          return Exception("Something went wrong!");
      }

    }catch(e){
      return Exception("Error: $e");
    }
  }
}