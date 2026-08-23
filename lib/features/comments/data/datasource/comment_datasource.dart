


import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/core/networking/api_client.dart';
import 'package:test_pro/features/comments/data/models/comment_model.dart';

import '../../../../dependency_injection/injection_container.dart';

abstract class CommentDatasource {
  Future<Either<Exception, List<CommentModel>>> getComments();
}


@lazySingleton
class CommentDatasourceImpl extends CommentDatasource{
  
  @override
  Future<Either<Exception, List<CommentModel>>> getComments() async{

    try{
      var response = await getIt<APIClient>().sendRequest.get('/comments');

      if(response.statusCode == 200){

        var data = response.data;
        List<dynamic> dataList = data;

        List<CommentModel> modelList = dataList.map((element)=> CommentModel.fromJson(element)).toList();

        if(modelList.isEmpty)return Left(Exception("No Comments found"));

        return Right(modelList);

      }else{
        return Left(Exception(response.statusMessage));
      }
    }catch(e){
      return Left(Exception(e.toString()));
    }

  }
}