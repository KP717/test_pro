

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/features/comments/domain/entity/comment_entity.dart';

import '../../../../dependency_injection/injection_container.dart';
import '../../data/repositories/comment_repository_impl.dart';

@lazySingleton
class GetCommentUseCase extends UseCase<List<CommentEntity>, NoParams>{

  @override
  Future<Either<Exception, List<CommentEntity>>> call(NoParams params) {
    return getIt<CommentRepositoryImpl>().getComments();
  }


}