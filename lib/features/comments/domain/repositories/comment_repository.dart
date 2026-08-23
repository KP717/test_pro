

import 'package:dartz/dartz.dart';
import 'package:test_pro/features/comments/domain/entity/comment_entity.dart';

abstract class CommentRepository{

  Future<Either<Exception, List<CommentEntity>>> getComments();

}