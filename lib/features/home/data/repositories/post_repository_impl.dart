

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/home/data/datasource/post_remote_data_source.dart';
import 'package:test_pro/features/home/data/models/post_model.dart';
import 'package:test_pro/features/home/domain/entity/post_entity.dart';
import 'package:test_pro/features/home/domain/repositories/post_repository.dart';

@lazySingleton
class PostRepositoryImpl implements PostRepository{


  PostRemoteDataSourceImpl dataSource = getIt<PostRemoteDataSourceImpl>();

  @override
  Future<Either<Exception, PostEntity>> createPost(PostEntity post) {
    return dataSource.createPost(PostModel.fromEntity(post));
  }

  @override
  Future<Either<Exception, List<PostEntity>>> getPosts() {
   return dataSource.getPosts();
  }
}