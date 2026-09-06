

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/posts/data/datasource/post_remote_data_source.dart';
import 'package:test_pro/features/posts/data/models/post_model.dart';
import 'package:test_pro/features/posts/domain/entity/post_comment_entity.dart';
import 'package:test_pro/features/posts/domain/entity/post_entity.dart';
import 'package:test_pro/features/posts/domain/repositories/post_repository.dart';

@lazySingleton
class PostRepositoryImpl implements PostRepository{


  PostRemoteDataSourceImpl dataSource = getIt<PostRemoteDataSourceImpl>();

  @override
  Future<Either<Exception, PostModel>> createPost(PostEntity post) async{
    return await dataSource.createPost(PostModel.fromEntity(post));
  }

  @override
  Future<Either<Exception, List<PostEntity>>> getPosts() async{
   return await dataSource.getPosts();
  }

  @override
  Future<Either<Exception, List<PostCommentEntity>>> getPostComment(int postId) async{
    return await dataSource.getPostComment(postId);
  }




}