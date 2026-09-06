


import 'package:dartz/dartz.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/features/posts/data/repositories/post_repository_impl.dart';
import 'package:test_pro/features/posts/domain/entity/post_comment_entity.dart';

import '../../../../dependency_injection/injection_container.dart';

class GetPostCommentUseCase extends UseCase<List<PostCommentEntity>, int>{

  @override
  Future<Either<Exception, List<PostCommentEntity>>> call(int postId) async{
    return getIt<PostRepositoryImpl>().getPostComment(postId);
  }

}