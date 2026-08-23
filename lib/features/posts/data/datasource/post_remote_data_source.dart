

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/core/networking/api_client.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  
  Future<Either<Exception, List<PostModel>>> getPosts();
  Future<Either<Exception, PostModel>> createPost(PostModel post);
}

@lazySingleton
class PostRemoteDataSourceImpl implements PostRemoteDataSource{

  APIClient apiClient = getIt<APIClient>();

  @override
  Future<Either<Exception, PostModel>> createPost(PostModel post) async{
    try{

      final response = await apiClient.sendRequest.post('/posts', data: jsonEncode({
        'title': post.title,
        'body': post.body,
        'userId': post.userId
      }));

      if(response.statusCode == 201){
        final data = response.data;
        final createdPost = PostModel.fromJson(data);
        return Right(createdPost);
      }else{
        return Left(Exception("Failed to create post"));
      }

    } on DioException catch(dioEx){
      return Left(Exception(dioEx.message));
    } catch(ex){
      return Left(Exception(ex.toString()));
    }
    
  }

  @override
  Future<Either<Exception, List<PostModel>>> getPosts() async{
   
   try{

      final response =await apiClient.sendRequest.get('/posts');

      if(response.statusCode == 200){
        
        final List<dynamic> data = response.data;
        final List<PostModel> posts = data.map((json) => PostModel.fromJson(json)).toList();
        return Right(posts);
      }else{
        return Left(Exception("Failed to fetch posts"));
      }

   } on DioException catch(dioEx){
      return Left(Exception(dioEx.message));
   } catch(ex){
      return Left(Exception(ex.toString()));
   }
  }

  

}
