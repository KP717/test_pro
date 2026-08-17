

import 'package:dartz/dartz.dart';
import 'package:test_pro/features/home/domain/entity/post_entity.dart';

abstract class PostRepository{

  Future<Either<Exception, List<PostEntity>>> getPosts();
  Future<Either<Exception, PostEntity>> createPost(PostEntity post);
}