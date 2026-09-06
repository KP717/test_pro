

import 'package:dartz/dartz.dart';
import 'package:test_pro/features/posts/domain/entity/post_comment_entity.dart';
import 'package:test_pro/features/posts/domain/entity/post_entity.dart';

abstract class PostRepository{

  Future<Either<Exception, List<PostEntity>>> getPosts();
  Future<Either<Exception, PostEntity>> createPost(PostEntity post);
  Future<Either<Exception, List<PostCommentEntity>>> getPostComment(int postId);


}